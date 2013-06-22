require 'spec_helper'

describe Api::RepositoriesController do

  let(:user) { FactoryGirl.create(:user)}

  describe "POST #create" do

    context do
      it "returns an error if name is not unique per user" do
        name = FactoryGirl.generate(:repository_name)
        post :create, :api_key => user.api_key, :name => name
        post :create, :api_key => user.api_key, :name => name
        should respond_with(:bad_request)
      end
    end

    context "a valid api user" do
      before(:each) { @old_repository_count = user.repositories.count }

      it "can create a new repository" do
        post :create, :api_key => user.api_key, :name => FactoryGirl.generate(:repository_name)

        should respond_with(:created)
        should respond_with_content_type(:json)
        user.repositories.count.should equal(@old_repository_count + 1)
      end

      it "can't create a repository without a 'name'" do
        post :create, :api_key => user.api_key
        should respond_with(:bad_request)
        should respond_with_content_type(:json)
        user.repositories.count.should equal(@old_repository_count)
      end
    end
  end

end
