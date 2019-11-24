class Evolution::Knight < Evolution::Kind
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
    super(user, SETTING)
  end

  def up?
    false
  end

end
