class Evaluation::Know

  def initialize(user)
    @user = user
  end

  def run
    update_knowledges
  end

  private

  def update_knowledges
    set_profile
    technologies.each(&method(:merge_knowledge))
  end

  def merge_knowledge(technology)
    knowledge_with_language_exist = @user.profile.knowledges.joins(:language).where("languages.id = ?", technology.language.id).last

    if knowledge_with_language_exist
      knowledge_with_language_exist.update(experience: technology.exercise, knowledge_type: set_knowledge_type(technology.language), level: level(technology.language))
    else
      @user.profile.knowledges << Knowledge.create(experience: technology.exercise, language: technology.language, knowledge_type: set_knowledge_type(technology.language), level: level(technology.language))
    end
  end

  def set_profile
    @user.profile = Profile.create(score: 0) unless @user.profile
  end

  def technologies
    Technology.joins(:language, repository: [:user]).where("users.id = ?", @user.id)
  end

  def set_knowledge_type(language)
    knowledge_type = nil
    knowledge_type = :basic if basic.include? language.description
    knowledge_type = :normal if normal.include? language.description
    knowledge_type = :rare if rare.include? language.description
    knowledge_type = :special if special.include? language.description
    knowledge_type
  end

  def level(language)
    commits = 0
    technologies.where("languages.description = ?", language.description).each do |technology|
      commits += technology.repository.commits_count
    end
    commits / settings[:commits_level]
  end

  #TODO:Informação que devem ir para o modulo admin
  def basic
    ["HTML", "CSS", "JavaScript"]
  end

  def normal
    ["Java", "Python", "Ruby", "PHP", "C#", "TypeScript"]
  end

  def rare
    ["XSLT", "R", "C", "C++", "Shell", "PowerShell", "Groovy", "Dockerfile", "Vue"]
  end

  def special
    ["Swift", "Objective-C ", "Go", "Elixir", "Erlang"]
  end

  def settings
    {commits_level: 25}
  end
end