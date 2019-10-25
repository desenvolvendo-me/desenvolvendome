require 'faraday'
require 'json'

class Api::Github

  def initialize(args = {})
    @github_api_key = ENV["GITHUB_API_KEY"]
    @connect = Faraday.new(:url => 'https://api.github.com')
  end

  def user(login)
    response = @connect.get "/users/#{login}?access_token=#{@github_api_key}"
    JSON.parse(response.body)
  end

  def repos(login)
    response = @connect.get "/users/#{login}/repos?access_token=#{@github_api_key}"
    JSON.parse(response.body)
  end

  def repo(login, repo)
    response = @connect.get "/repos/#{login}/#{repo}?access_token=#{@github_api_key}"
    JSON.parse(response.body)
  end

  def commits(login, repo)
    response = @connect.get "/repos/#{login}/#{repo}/contributors?access_token=#{@github_api_key}"
    JSON.parse(response.body)
  end

  def languages(login, repo)
    response = @connect.get "/repos/#{login}/#{repo}/languages?access_token=#{@github_api_key}"
    JSON.parse(response.body)
  end

end