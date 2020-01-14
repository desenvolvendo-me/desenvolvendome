module DashboardHelper

  def self.per_page
    group_event_page = Ahoy::Event.group("properties -> 'page'").count
    group_event_page = group_event_page.delete_if {|k, v| k.include?("profile")}
    group_event_page = group_event_page.delete_if {|k, v| k.include?("interest")}
    group_event_page
  end

  def self.per_page_profile_between(number_accesses_min, number_accesses_max)
    events_page = Ahoy::Event.group("properties -> 'page'").count
    events_profile = events_page.delete_if {|k, v| k.exclude?("profile")}
    events_between = events_profile.delete_if {|k, v| (v < number_accesses_min or v > number_accesses_max)}
    events_between.sort_by {|e| e.last}.reverse
  end

end