class Profile::Evolution::Kind
  DESCRIPTION_MAX_LEVEL = "Nível Máximo"
  @settings = {}

  def initialize(user, settings)
    @settings = settings
    @user = user
    @evaluation = @user.profile.evaluation
  end

  def run
    create_evaluation unless level_up?
  end

  def level
    lv = levels(@evaluation.xp) unless level_up?
    lv = @settings[:max_level] if max
    lv
  end

  def level_up?
    (repositories >= @settings[:role][:level_up][:repositories] and @evaluation.xp >= @settings[:role][:level_up][:xp])
  end

  def next_level
    level = {number: 0, percentage: 0}
    level[:number] = max ? DESCRIPTION_MAX_LEVEL : "+#{xp_next_level}"
    level[:percentage] = max ? 100 : (1 - (xp_next_level.to_f / @settings[:role][:calc].to_f)) * 100
    level
  end

  private

  def create_evaluation
    calculating_xp
  end

  def repositories
    @user.repositories.where("commits_count >= #{@settings[:role][:repository_size]}").count
  end

  def xp_next_level
    @settings[:role][:calc] - (@evaluation.xp % @settings[:role][:calc])
  end

  def max
    (@evaluation.xp - @settings[:role][:commits_preview]) >= @settings[:role][:level_up][:xp]
  end

  def calculating_xp
    quality = 0

    @user.practices_per_week.each do |period, contributions|
      commits = 0
      additions = 0
      deletions = 0

      contributions.each do |contribution|
        commits += contribution.commits
        additions += contribution.additions
        deletions += contribution.deletions

        contribution.update(calculated: true)
      end

      quality += calculate(commits, additions, deletions)

      @evaluation.update(evaluation_type: @settings[:role][:kind], xp: quality.round)
      @evaluation.update(level: level)

    end

    quality.round
  end

  def calculate(commits, additions, deletions)
    return 0 if (commits + additions + deletions).eql?(0)
    return 10 unless weekly_minimum(additions, deletions)
    return 10 if proportion_minimal(additions, commits, deletions)
    return 50 if commit_minimun(commits)

    (commits.to_f / (additions + deletions).to_f) * 1000
  end

  def commit_minimun(commits)
    commits < 25
  end

  def proportion_minimal(additions, commits, deletions)
    ((additions + deletions) / commits) < 5
  end

  def weekly_minimum(additions, deletions)
    ((additions > 50) and (deletions > 5))
  end

  def levels(xp)
    # Xp = [(Nível Atual * Classe XP) + Nível Anterior] - Máxima Evolução Anterior
    level = 1
    minimum_xp = 0
    @settings[:max_level].times do |l|
      l += 1
      minimum_xp += (@settings[:role][:calc] * l) - @settings[:role][:calc]
      max_xp = (((@settings[:role][:calc] * l) - 1) + minimum_xp)
      if (xp - @settings[:role][:commits_preview]).between?(minimum_xp, max_xp)
        level = l
        break
      end
    end
    level
  end

end
