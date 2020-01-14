module DashboardHelper

  def self.per_page
    group_event_page = Ahoy::Event.group("properties -> 'page'").count
    group_event_page = group_event_page.delete_if {|k, v| k.include?("profile")}
    group_event_page = group_event_page.delete_if {|k, v| k.include?("interests")}
    group_event_page
  end

  def self.per_page_profile_between(number_accesses_min, number_accesses_max)
    group_event_page = Ahoy::Event.group("properties -> 'page'").count
    group_event_page = group_event_page.delete_if {|k, v| k.include?("profile") and (v < number_accesses_min or v > number_accesses_max)}
    group_event_page = group_event_page.delete_if {|k, v| k.eql?("/")}
    group_event_page = group_event_page.delete_if {|k, v| k.include?("analyze")}
    group_event_page = group_event_page.delete_if {|k, v| k.include?("compare")}
    group_event_page = group_event_page.delete_if {|k, v| k.include?("interests")}
    group_event_page
  end

end