require 'faraday'
require 'json'

class Github::Api

  def initialize(args = {})
    @github_api_key = ENV["GITHUB_API_KEY"]
    @connect = Faraday.new(:url => 'https://api.github.com')
  end

  def user(login)
    response = @connect.get "/users/#{login}?access_token=#{@github_api_key}"
    JSON.parse(response.body)
  end

  def repos(login, page)
    response = @connect.get "/users/#{login}/repos?page=#{page + 1}&per_page=100&access_token=#{@github_api_key}"
    JSON.parse(response.body)
  end

  def repo(login, repo)
    response = @connect.get "/repos/#{login}/#{repo}?access_token=#{@github_api_key}"
    JSON.parse(response.body)
  end

  def commits(login, repo)
    response = @connect.get "/repos/#{login}/#{repo}/contributors?access_token=#{@github_api_key}"
    if response.status.eql? 200
      JSON.parse(response.body)
    else
      []
    end
  end

  def languages(login, repo)
    response = @connect.get "/repos/#{login}/#{repo}/languages?access_token=#{@github_api_key}"
    JSON.parse(response.body)
  end

end