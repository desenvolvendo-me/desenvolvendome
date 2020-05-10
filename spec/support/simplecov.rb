require 'simplecov'

SimpleCov.start 'rails' do
  add_filter do |source_file|
    source_file.lines.count < 10
  end

  add_group "Feactures", "app/features" #Pendente
  add_group "Businesses", "app/businesses"
  add_group "Models", "app/models"
  add_group "Views", "app/views" #Pendente
  add_group "Controllers", "app/controllers" #Pendente
  add_group "Helpers", "app/helpers"
  add_group "Performances", "app/performances"
  add_group "Mailers", "app/mailers"
  add_group "Jobs", "app/jobs"
  add_group "Lib", "app/lib"
  add_group "Admin", "app/admin"


end
