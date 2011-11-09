require 'spec_helper'

describe Api::CommitsController do
  describe "a valid API user" do
    it "can create a new commit" do
      user = FactoryGirl.create(:user)
      old_commit_count = user.commits.count

      post :create, :api_key => user.api_key

      response.should be_success
      user.commits.count.should equal(old_commit_count + 1)
    end
  end

  describe "a invalid API user" do
    it "can't create a new commit without an API key" do
      post :create

      response.should be_error
    end

    it "can't create a new commit with an invalid API key" do
      post :create, :api_key => 'abcdefgh12345678'

      response.should be_error
    end
  end

  describe "a valid API call" do
    it "adds a commit to a repository" do
      user = FactoryGirl.create(:user)
      repository = user.repositories.create(:name => "Test repository")
      old_commit_count = repository.commits.count

      post :create, :api_key => user.api_key, :repository => repository.id

      response.should be_success
      repository.commits.count.should equal(old_commit_count + 1)
    end
  end

  describe "an invalid API call" do
    it "can't add a commit to a non existing repository" do
      user = FactoryGirl.create(:user)
      post :create, :api_key => user.api_key, :repository => 1

      response.should be_error
    end

    it "can't add a commit to a other users repository" do
      user_a = FactoryGirl.create(:user)
      user_b = FactoryGirl.create(:user)

      repository = user_a.repositories.create(:name => "Test repository")
      old_commit_count = repository.commits.count

      post :create, :api_key => user_b.api_key, :repository => repository.id

      response.should be_error
      repository.commits.count.should equal(old_commit_count)
    end
  end
end
