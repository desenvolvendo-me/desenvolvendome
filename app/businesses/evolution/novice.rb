class Evolution::Novice < Evolution::Kind
  SETTING = {
      min_level: 1,
      max_level: 10,
      role: {
          kind: :novice,
          calc: 30,
          repository_size: 100,
          commits_preview: 150,
          level_up: {
              repositories: 3,
              commits: 300
          }
      }
  }

  def initialize(user)
    super(user, SETTING)
  end

end
