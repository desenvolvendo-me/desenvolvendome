require 'faraday'
require 'json'

class Github::Api

  def initialize(args = {})
    @github_api_key = ENV["GITHUB_API_KEY"]
    @connect = Faraday.new(:url => 'https://api.github.com')
    @api_control = ApiControl.find_or_create_by(key: @github_api_key)
  end

  def user(login)
    response = @connect.get "/users/#{login}?access_token=#{@github_api_key}"
    update_rate_limit(response)
    JSON.parse(response.body)
  end

  def repos(login, repositories_count)
    response = @connect.get "/users/#{login}/repos?per_page=#{repositories_count}&sort=pushed&access_token=#{@github_api_key}"
    update_rate_limit(response)
    JSON.parse(response.body)
  end

  def repo(login, repo)
    response = @connect.get "/repos/#{login}/#{repo}?access_token=#{@github_api_key}"
    update_rate_limit(response)
    JSON.parse(response.body)
  end

  def commits(login, repo)
    response = @connect.get "/repos/#{login}/#{repo}/contributors?access_token=#{@github_api_key}"
    update_rate_limit(response)
    if response.status.eql? 200
      JSON.parse(response.body)
    else
      []
    end
  end

  def languages(login, repo)
    response = @connect.get "/repos/#{login}/#{repo}/languages?access_token=#{@github_api_key}"
    update_rate_limit(response)
    JSON.parse(response.body)
  end

  private

  def update_rate_limit(response)
    @api_control.update(limit: response.headers["x-ratelimit-limit"].to_i, consume: response.headers["x-ratelimit-remaining"].to_i, reset: DateTime.strptime(response.headers["x-ratelimit-reset"], '%s'), description: "O Github disponiliza 5000 request por hora.")
  end

end