require 'faraday'
require 'json'
require 'dotenv'

class Github

  def initialize(args = {})
    @connect = Faraday.new(:url => 'https://api.github.com')
  end

  def getUser(login)
    response = @connect.get "/users/#{login}"
    return JSON.parse(response.body) || nil
  end

end