# initializers/active_record_initializers.rb
class ActiveRecord::Base
  # do not accept a column_name from the outside without sanitizing it
  # as this can be prone to sql injection
  def self.starts_with(column_name, prefix)
    if prefix.kind_of?(Array)
      ids = []
      prefix.each do |p|
        ids += (where("lower(#{column_name}) like ?", "#{p.downcase}%").pluck(:id))
      end
      where(id: ids)
    else
      where("lower(#{column_name}) like ?", "#{prefix.downcase}%")
    end
  end
end