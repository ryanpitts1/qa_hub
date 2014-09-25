require 'spec_helper'
include Warden::Test::Helpers

describe "routing to releases page" do
  before do
    @user = FactoryGirl.create(:user, :admin)
    login_as @user, :scope => :user
    
    @release = FactoryGirl.create(:release)
  end
  
  it "routes /releases/new to releases#new" do
  	expect(get: "/releases/new").to route_to(
  	  controller: "releases",
  	  action: "new"
  	)
  end

  it "routes /releases/:release_id/edit to releases#edit" do
    expect(get: "/releases/#{@release.id}/edit").to route_to(
      controller: "releases",
      action: "edit",
      id: "#{@release.id}"
    )
  end
end
