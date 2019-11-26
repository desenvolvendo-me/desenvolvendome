# NOTA:
# O nome da classe está curta Lang, pois gerar conflito com a model Language, caso use o mesmo nome dado pelo github
# FIXME: Corrigir os conflitos entre nomes das classes

class Github::Importation::Lang < Github::Importation

  def run(user)
    @user = user
    import
  end


  private

  def import
    @user.repositories.each do |repository|
      get_langs(repository).each do |lang|
        set_technology(lang, get_language(lang), repository)
      end
    end
  end

  def set_technology(lang, language, repository)
    if (technology = repository.technologies.find_by(language: language))
      technology.update(exercise: lang[1])
    else
      Technology.create(exercise: lang[1], language: language, repository: repository)
    end
  end

  def get_language(lang)
    Language.find_or_create_by(description: lang[0])
  end


  def get_langs(repository)
    @github.languages(@user.login, repository.name)
  end

end