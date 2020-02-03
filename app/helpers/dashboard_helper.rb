module DashboardHelper

  def self.per_page
    events_without_profile = events_page.delete_if {|k, v| k.include?("profile")}
    events_without_sale = events_without_profile.delete_if {|k, v| k.include?("interest")}
    events_without_sale.sort_by {|e| e.last}.reverse
  end

  def self.per_page_sale
    events_only_sale = events_page.delete_if {|k, v| k.exclude?("interests/new")}
    events_only_sale
  end

  def self.per_page_profile_between(number_accesses_min, number_accesses_max)
    events_only_profile = events_page.delete_if {|k, v| k.exclude?("profile")}
    events_between = events_only_profile.delete_if {|k, v| (v < number_accesses_min or v > number_accesses_max)}
    events_between.sort_by {|e| e.last}.reverse
  end

  def self.more_engaged
    users_50_visits_most = Ahoy::Visit.joins(:user).group("users.login").count.sort_by {|e| e.last}.reverse.take(50)
    users_50_evaluations_most = User.order(:evaluations_count).take(50).pluck(:login, :evaluations_count)

    users_50 = []
    users_50_evaluations_most.each do |vm50|
      commom = users_50_visits_most.detect {|e| e.first == vm50.first}
      users_50.push([vm50.first, commom ? vm50.last * commom.last : vm50.last])
    end
    users_50.sort_by {|e| e.last}.reverse
  end

  private

  def self.events_page
    Ahoy::Event.group("properties -> 'page'").count
  end

end