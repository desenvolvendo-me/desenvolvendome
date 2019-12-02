Dir[Rails.root.join('lib/rails_admin/**/*.rb')].each {|f| require f}
RailsAdmin.config do |config|

  config.actions do
    reimport do
      only User
    end
  end

end
