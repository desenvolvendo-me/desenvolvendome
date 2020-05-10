class Profile::Evolution::Knight < Profile::Evolution::Kind
  #TODO:Informação que devem ir para o modulo admin
  SETTINGS = {
      min_level: 1,
      max_level: 10,
      role: {
          kind: :knight,
          calc: 100,
          repository_size: 500,
          commits_preview: 2750,
          level_up: {
              repositories: 3,
              xp: 5500
          }
      }
  }

  def initialize(user)
    super(user, SETTINGS)
  end

end
