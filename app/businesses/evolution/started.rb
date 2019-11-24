class Evolution::Started < Evolution::Kind
  SETTING = {
      min_level: 1,
      max_level: 10,
      role: {
          kind: :started,
          calc: 15,
          repository_size: 50,
          commits_preview: 0,
          level_up: {
              repositories: 3,
              commits: 150
          }
      }
  }

  def initialize(user)
    super(user, SETTING)
  end

end
