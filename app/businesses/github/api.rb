require 'faraday'
require 'json'

class Github::Api

  def initialize(args = {})
    @connect = Faraday.new(:url => 'https://api.github.com')
    get_api_key
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

  #TODO: Remover
  def commits(login, repo)
    response = @connect.get "/repos/#{login}/#{repo}/contributors?access_token=#{@github_api_key}"
    update_rate_limit(response)
    if response.status.eql? 200
      JSON.parse(response.body)
    else
      []
    end
  end

  def contributors(login, repo)
    response = @connect.get "/repos/#{login}/#{repo}/stats/contributors?access_token=#{@github_api_key}"
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

  def get_api_key
    apis_keys = ApiControl.where("consume > 100")
    @api_control = apis_keys.any? ? apis_keys.first : ApiControl.last
    @github_api_key = @api_control.key
  end

  def update_rate_limit(response)
    @api_control.update(limit: response.headers["x-ratelimit-limit"].to_i, consume: response.headers["x-ratelimit-remaining"].to_i, reset: DateTime.strptime(response.headers["x-ratelimit-reset"], '%s'))
  end

end