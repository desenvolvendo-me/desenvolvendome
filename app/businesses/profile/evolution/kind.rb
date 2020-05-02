class Profile::Evolution::Kind
  DESCRIPTION_MAX_LEVEL = "Nível Máximo"
  @settings = {}

  def initialize(user, settings)
    @settings = settings
    @user = user
  end

  def run
    create_evaluation unless level_up?
  end

  def level
    lv = @settings[:min_level] + ((commits - @settings[:role][:commits_preview]) / @settings[:role][:calc]) unless level_up?
    lv = @settings[:max_level] if max
    lv
  end

  def level_up?
    (repositories >= @settings[:role][:level_up][:repositories] and commits >= @settings[:role][:level_up][:commits])
  end

  def next_level
    level = {number: 0, percentage: 0}
    level[:number] = max ? DESCRIPTION_MAX_LEVEL : "+#{xp_next_level}"
    level[:percentage] = max ? 100 : (1 - (xp_next_level.to_f / @settings[:role][:calc].to_f)) * 100
    level
  end

  private

  def create_evaluation
    evaludation = @user.profile.evaluation

    if evaludation
      evaludation.update(level: level, evaluation_type: @settings[:role][:kind], xp: xp)
    else
      Evaluation.create(level: level, evaluation_type: @settings[:role][:kind], xp: xp, profile: @user.profile)
    end
  end

  def commits
    @user.repositories.sum(:commits_count)
  end

  def repositories
    @user.repositories.where("commits_count >= #{@settings[:role][:repository_size]}").count
  end

  def xp_next_level
    @settings[:role][:calc] - (commits % @settings[:role][:calc])
  end

  def max
    commits >= @settings[:role][:level_up][:commits]
  end

  def xp
    commits = 0
    additions = 0
    deletions = 0
    quality = 0

    contributor_ids = @user.contributors.pluck(:id)

    Contribution.where(contributor_id: contributor_ids).group_by(&:period).each do |period, contributions|
      contributions.each do |contribution|
        commits += contribution.commits
        additions += contribution.additions
        deletions += contribution.deletions
      end
      quality += calculate(commits, additions, deletions)
    end

    quality.round
  end

  def calculate(commits, additions, deletions)
    return 10 unless weekly_minimum(additions, deletions)
    return 10 if proportion_minimal(additions, commits, deletions)

    (commits.to_f / (additions + deletions).to_f) * 1000
  end

  def proportion_minimal(additions, commits, deletions)
    ((additions + deletions) / commits) < 5
  end

  def weekly_minimum(additions, deletions)
    ((additions > 50) and (deletions > 5))
  end

end
