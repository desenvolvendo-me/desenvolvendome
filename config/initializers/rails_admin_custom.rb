Dir[Rails.root.join('lib/rails_admin/**/*.rb')].each {|f| require f}
RailsAdmin.config do |config|

  config.actions do
    reimport do
      only User
    end
  end

  config.model "User" do
    list do
      include_fields :login, :name, :evaluations_count, :repositories_count, :followers, :following
    end
  end

end
