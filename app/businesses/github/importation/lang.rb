# NOTA:
# O nome da classe está curta Lang, pois gerar conflito com a model Language, caso use o mesmo nome dado pelo github
# FIXME: Corrigir os conflitos entre nomes das classes

class Github::Importation::Lang < Github::Importation

  def run(user)
    @user = user
    languages
  end

  def languages
    @user.repositories.each do |repository|
      @github.languages(@user.login, repository.name).each do |language|
        lang = Language.find_or_create_by(description: language[0])

        technology = repository.technologies.find_by(language: lang)
        unless technology
          Technology.create(exercise: language[1], language: lang, repository: repository)
        else
          technology.update(exercise: language[1])
        end
      end
    end
  end


end