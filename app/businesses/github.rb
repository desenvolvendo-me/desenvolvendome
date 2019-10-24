require 'faraday'
require 'json'
require 'dotenv'

class Github

  def initialize(args = {})
    @connect = Faraday.new(:url => 'https://api.github.com')
  end

  def user(login)
    response = @connect.get "/users/#{login}?access_token=d2df4752c119c368fababddabaf963f05c07f015"
    JSON.parse(response.body)
  end

  def repos(login)
    response = @connect.get "/users/#{login}/repos?access_token=d2df4752c119c368fababddabaf963f05c07f015"
    JSON.parse(response.body)
  end

  def repo(login, repo)
    response = @connect.get "/repos/#{login}/#{repo}?access_token=d2df4752c119c368fababddabaf963f05c07f015"
    JSON.parse(response.body)
  end

end