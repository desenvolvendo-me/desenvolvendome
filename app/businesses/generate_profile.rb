class GenerateProfile

  def initialize(user)
    @experience_per_language = {}
    @user = user
    run
  end

  def run
    @user.profile = Profile.create(score: 0) unless @user.profile
    knowledges
  end

  def knowledges
    exercise_total = technologies.sum(:exercise)

    technologies.each do |technology|
      language_exist = @user.profile.knowledges.joins(:language).where("languages.id = ?", technology.language.id).last
      if language_exist
        language_exist.update(experience: calc_experience_per_technology(exercise_total, technology))
      else
        @user.profile.knowledges << Knowledge.create(experience: calc_experience_per_technology(exercise_total, technology), language: technology.language)
      end
    end
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

  private

  def technologies
    Technology.joins(repository: [:user]).where("users.id = ?", @user.id)
  end

  def calc_experience_per_technology(exercise_total, technology)
    experience(technology) / exercise_total * 100
  end

end