require "rails_helper"

RSpec.feature "Profile", :type => :feature do

  scenario "show user" do
    user = create(:user, :with_profile)
    login_as(user, :scope => :user)

    visit "/"

    click_on "Meu Perfil"

    expect(page).to have_text("seus repositórios")
  end

end