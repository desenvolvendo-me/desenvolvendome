class Evaluation::Know

  def initialize(user)
    @user = user
    @experience_per_language = {}
  end

  def run
    update_knowledges
  end

  def update_knowledges
    set_profile
    exercise_total = technologies.sum(:exercise)
    technologies.each do |technology|
      merge_knowledge(exercise_total, technology)
    end
  end

  def calc_experience_per_technology(exercise_total, technology)
    experience(technology) / exercise_total * 100
  end

  private

  def merge_knowledge(exercise_total, technology)
    language_exist = @user.profile.knowledges.joins(:language).where("languages.id = ?", technology.language.id).last
    if language_exist
      language_exist.update(experience: calc_experience_per_technology(exercise_total, technology))
    else
      @user.profile.knowledges << Knowledge.create(experience: calc_experience_per_technology(exercise_total, technology), language: technology.language)
    end
  end

  def set_profile
    @user.profile = Profile.create(score: 0) unless @user.profile
  end

  def technologies
    Technology.joins(:language, repository: [:user]).where("repositories.commits_count > 100 and users.id = ?", @user.id)
  end

  def experience(technology)
    language = technology.language.description

    if @experience_per_language.has_key? language
      @experience_per_language[language][1] += technology.exercise
    else
      @experience_per_language.merge! language => [language, technology.exercise]
    end

    @experience_per_language[language][1]
  end

end