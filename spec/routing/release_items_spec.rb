require 'spec_helper'
include Warden::Test::Helpers

describe "routing to release items page" do
  before do
    @user = FactoryGirl.create(:user, :admin)
    login_as @user, :scope => :user
    
    @release = FactoryGirl.create(:release)
  end

  it "routes /release_items?id=:release_id to releases#index" do
    expect(get: "/release_items?id=#{@release.id}").to route_to(
      controller: "release_items",
      action: "index",
      id: "#{@release.id}"
    )
  end
end
