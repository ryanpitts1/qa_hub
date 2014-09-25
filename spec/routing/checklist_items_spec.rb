require 'spec_helper'
include Warden::Test::Helpers

describe "routing to checklists page" do
  before do
    @user = FactoryGirl.create(:user, :admin)
    login_as @user, :scope => :user
    
    @release = FactoryGirl.create(:release)
  end

  it "routes /checklists/:release_id to releases#show" do
    expect(get: "/checklists/#{@release.id}").to route_to(
      controller: "checklists",
      action: "show",
      id: "#{@release.id}"
    )
  end
end
