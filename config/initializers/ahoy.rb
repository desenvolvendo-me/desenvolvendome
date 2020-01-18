class Ahoy::Store < Ahoy::DatabaseStore
end

# set to true for JavaScript tracking
Ahoy.api = false
Ahoy.user_agent_parser = :device_detector
Ahoy.track_bots = true
Ahoy.geocode = false