class GenerateProfile

  def initialize(user)
    @experience_per_language = {}
    @user = user
    @experience_total = 0
    run
    knowledges
  end

  def run
    @user.profile = Profile.create(score: 0) unless @user.profile
  end

  def knowledges
    Technology.joins(repository: [:user]).where("users.id = ?", @user.id).each do |technology|
      @user.profile.knowledges << Knowledge.create(experience: experience(technology), language: technology.language)
    end
  end

  def experience(techology)
    language = techology.language.description
    @experience_total += techology.exercise

    if @experience_per_language.has_key? language
      @experience_per_language[language.description][1] += techology.exercise
    else
      @experience_per_language.merge! language => [language, techology.exercise]
    end
    @experience_per_language[language][1]
  end

end