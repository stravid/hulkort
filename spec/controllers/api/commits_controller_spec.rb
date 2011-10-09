require 'spec_helper'

describe Api::CommitsController do
  describe "A valid API user" do
    it "Can create a new commit" do
      user = FactoryGirl.create(:user)
      old_commit_count = user.commits.count

      post :create, :api_key => user.api_key

      response.should be_success
      user.commits.count.should equal(old_commit_count + 1)
    end
  end

  describe "A invalid API user" do
    it "Can't create a new commit without an API key" do
      post :create

      response.should be_error
    end

    it "Can't create a new commit with an invalid API key" do
      post :create, :api_key => 'abcdefgh12345678'

      response.should be_error
    end
  end
end
