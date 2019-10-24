require 'faraday'
require 'json'
require 'dotenv'

class Github

  def initialize(args = {})
    @connect = Faraday.new(:url => 'https://api.github.com')
  end

  def user(login)
    response = @connect.get "/users/#{login}"
    JSON.parse(response.body)
  end

  def repos(login)
    response = @connect.get "/users/#{login}/repos"
    JSON.parse(response.body)
  end

  def repo(login, repo)
    response = @connect.get "/repos/#{login}/#{repo}"
    JSON.parse(response.body)
  end

end