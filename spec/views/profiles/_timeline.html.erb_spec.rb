require "rails_helper"

RSpec.describe "_timeline.html.erb" do
  it "timeline" do
    user = create(:user, :with_profile)

    render :partial => "profiles/timeline.html.erb", :locals => {:user => user}

    expect(rendered).to match /Perfil/
    expect(rendered).to match /Experiência/
    expect(rendered).to match /Level/
    expect(rendered).to match /v0.0.0/
  end
end