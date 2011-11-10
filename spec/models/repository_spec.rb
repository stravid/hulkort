require 'spec_helper'

describe Repository do
  
  context "validations" do
    let(:repository) { FactoryGirl.create(:repository) }
    subject { FactoryGirl.create(:repository) }

    it { should belong_to(:user) }
    it { should have_many(:commits) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:shortcode) }
    
    it "should validate uniqueness of shortcode" do
      new_repository = FactoryGirl.create(:repository)
      new_repository.shortcode = repository.shortcode
      new_repository.save.should be_false
      new_repository.errors[:shortcode].should eql(["has already been taken"])
    end

    it "should validate uniqueness of name per user" do
      user = FactoryGirl.create(:user)
      user.repositories.create(:name => "my repository")
      repository = user.repositories.new(:name => "my repository", :user_id => user.id)
      repository.save.should be_false
      repository.errors[:name].should eql(["has already been taken"])
    end
  end
end
