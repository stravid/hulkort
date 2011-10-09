require 'spec_helper'

describe User do
  before(:all) { @user = FactoryGirl.create(:user) }

  it { should have_db_index(:api_key).unique(true) }
  it { should_not allow_mass_assignment_of(:api_key) }

  it "should be able to create a valid user" do
    @user.should be_valid
  end

  it "has an API key after creation" do
    @user.api_key.should_not == nil
  end

  it "should require api_key to match a SHA1 with length 24" do
    @user.api_key.should match /^[a-z0-9]{24}$/
  end

end