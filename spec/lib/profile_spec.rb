require 'rails_helper'
require 'rake'

describe 'profile' do

  before :all do
    Rake.application.rake_require "tasks/profile"
    Rake::Task.define_task(:environment)

    create(:user, :with_repositories, :with_profile, login: "marcodotcastro")
  end

  xit "update" do
    Rake.application.invoke_task "profile:update[marcodotcastro]"
  end

  xit "update_all" do
    Rake.application.invoke_task "profile:update_all"
  end

  it "clean_duplicate" do
    Rake.application.invoke_task "profile:clean_duplicate"
  end

end