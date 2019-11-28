class Profile::Rating::Know
  #TODO:Informação que devem ir para o modulo admin
  @technologies = nil
  SETTINGS = {
      commits_level: 25,
      languages: {
          basic: ["HTML", "CSS", "JavaScript", "Shell", "PowerShell"],
          normal: ["Java", "Python", "Ruby", "PHP", "C#", "TypeScript"],
          rare: ["C", "C++", "Groovy", "Dockerfile", "Vue"],
          special: ["Swift", "Objective-C ", "Kotlin", "Go", "Elixir", "Erlang"]}
  }

  def initialize(user)
    @user = user
    @technologies = get_technologies
  end

  def run
    set_knowledges
  end

  private

  def set_knowledges
    @technologies.each(&method(:merge_knowledge))
  end

  def merge_knowledge(technology)
    language = technology.language

    if (knowledge_with_language = knowledge_with_language(language))
      knowledge_with_language.update(experience: technology.exercise, knowledge_type: set_knowledge_type(language), level: get_level(language))
    else
      Knowledge.create(profile: @user.profile, experience: technology.exercise, language: language, knowledge_type: set_knowledge_type(language), level: get_level(language))
    end
  end

  def knowledge_with_language(language)
    @user.profile.knowledges.joins(:language).where("languages.id = ?", language.id).take
  end

  def set_knowledge_type(language)
    knowledge_type = :basic if SETTINGS[:languages][:basic].include? language.description
    knowledge_type = :normal if SETTINGS[:languages][:normal].include? language.description
    knowledge_type = :rare if SETTINGS[:languages][:rare].include? language.description
    knowledge_type = :special if SETTINGS[:languages][:special].include? language.description
    knowledge_type
  end

  def get_technologies
    Technology.joins(:language, repository: [:user]).where("users.id = ?", @user.id)
  end

  def get_level(language)
    commits = 0
    @technologies.where("languages.description = ?", language.description).each do |technology|
      commits += technology.repository.commits_count.to_i #FIXME: Vindo nil
    end
    commits / SETTINGS[:commits_level]
  end

end