Dir[Rails.root.join('lib/rails_admin/**/*.rb')].each {|f| require f}
RailsAdmin.config do |config|

  config.actions do
    reimport do
      only User
    end
    profile do
      only User
    end
  end

  config.model "User" do
    list do
      include_fields :login, :evaluations_count, :repositories_count, :followers, :following, :email
      field :evaluations_count do
        label "Evaluations"
      end
      field :repositories_count do
        label "Repositories"
      end
    end
  end

end
