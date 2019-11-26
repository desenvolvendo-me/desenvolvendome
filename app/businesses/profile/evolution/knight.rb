class Profile::Evolution::Knight < Profile::Evolution::Kind
  #TODO:Informação que devem ir para o modulo admin
  SETTINGS = {
      min_level: 1,
      max_level: 10,
      role: {
          kind: :knight,
          calc: 300,
          repository_size: 500,
          commits_preview: 300,
          level_up: {
              repositories: 3,
              commits: 3000
          }
      }
  }

  def initialize(user)
    super(user, SETTINGS)
  end

  def level_up?
    false
  end

end
