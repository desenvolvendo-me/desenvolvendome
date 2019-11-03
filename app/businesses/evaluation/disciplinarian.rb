class Evaluation::Disciplinarian

  def initialize(user)
    @user = user
  end

  def run
    create_evaluation
  end

  def level
    case commits_index
    when 0
      level = 0
    when 1..2
      level = 1
    when 2..3
      level = 2
    when 3..4
      level = 3
    when 4..5
      level = 4
    else
      level = 5
    end
    level
  end

  def score
    0.2 * level
  end

  private

  def commits_index
    index = 0
    repositories = @user.repositories

    commits_100 = repositories.where("commits_count >= 100 and commits_count < 250").count
    commits_250 = repositories.where("commits_count >= 250 and commits_count < 500").count
    commits_500 = repositories.where("commits_count >= 500 and commits_count < 1000").count
    commits_1000 = repositories.where("commits_count >= 1000 and commits_count < 2500").count
    commits_2500 = repositories.where("commits_count >= 2500").count

    if commits_100 > 0
      index += 1 + (0.1 * commits_100)
    end

    if commits_250 > 0
      index += 2 + (0.2 * commits_250)
    end

    if commits_500 > 0
      index += 3 + (0.3 * commits_500)
    end

    if commits_1000 > 0
      index += 4 + (0.4 * commits_1000)
    end

    if commits_2500 > 0
      index += 5 + (0.5 * commits_2500)
    end

    index
  end

  def create_evaluation
    evaludation = @user.profile.evaluations.where(evaluation_type: :disciplinarian).take
    if evaludation
      evaludation.update(level: level)
    else
      Evaluation.create(level: level, evaluation_type: :disciplinarian, profile: @user.profile)
    end
  end

end
