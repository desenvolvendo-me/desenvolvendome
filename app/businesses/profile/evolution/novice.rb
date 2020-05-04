class Profile::Evolution::Novice < Profile::Evolution::Kind
  #TODO:Informação que devem ir para o modulo admin
  SETTINGS = {
      min_level: 1,
      max_level: 10,
      role: {
          kind: :novice,
          calc: 50,
          repository_size: 100,
          commits_preview: 1375,
          level_up: {
              repositories: 3,
              xp: 2750
          }
      }
  }

  def initialize(user)
    super(user, SETTINGS)
  end

end
