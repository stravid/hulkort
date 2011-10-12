require 'spec_helper'

describe UsersController do
  before(:all) { @current_user = FactoryGirl.create(:user) }

  describe "#show" do
    it "fetches all commits which belong to the current user" do
      4.times { FactoryGirl.create(:user).commits.create }
      7.times { @current_user.commits.create }
      @current_user.commits.count.should equal(7)
    end
  end

end
