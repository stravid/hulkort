require 'spec_helper'

describe Api::CommitsController do
  describe "a valid API call" do
    let(:user) { FactoryGirl.create(:user) }
    let(:repository) { user.repositories.create(:name => "Test repository") }

    it "has a valid API key" do
      old_commit_count = user.commits.count

      post :create, :api_key => user.api_key

      response.should be_success
      user.commits.count.should equal(old_commit_count + 1)
    end

    it "has a valid repository" do
      old_commit_count = repository.commits.count

      post :create, :api_key => user.api_key, :repository => repository.id

      response.should be_success
      repository.commits.count.should equal(old_commit_count + 1)
    end
  end

  describe "an invalid API call" do
    it "has no API key" do
      post :create

      response.should be_error
    end

    it "has an invalid API key" do
      post :create, :api_key => 'abcdefgh12345678'

      response.should be_error
    end

    context "with an repository id" do
      let(:user) { FactoryGirl.create(:user) }

      it "has an non existing repository id" do
        post :create, :api_key => user.api_key, :repository => 1

        response.should be_error
      end

      it "has an repository id from another user" do
        user_two = FactoryGirl.create(:user)
        repository = user_two.repositories.create(:name => "Test repository")
        old_commit_count = repository.commits.count

        post :create, :api_key => user.api_key, :repository => repository.id

        response.should be_error
        repository.commits.count.should equal(old_commit_count)
      end
    end
  end
end