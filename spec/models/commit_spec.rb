require 'spec_helper'

describe Commit do
  it { should belong_to(:user) }
  it { should belong_to(:repository) }

  it "should limit creation time correctly" do
    7.times { Commit.create }
    @commit = Commit.first
    @commit.created_at = 10.days.ago
    @commit.save
    Commit.limit_time_to(9.days.ago).count.should equal(6)
  end

  describe "daily_count" do
    it "should return the correct number of days" do
      result_a = Commit.daily_commits(5)
      result_b = Commit.daily_commits

      result_a.count.should equal(5)
      result_b.count.should equal(30)
    end

    it "should return the correct count per day" do
      FactoryGirl.create(:commit)
      FactoryGirl.create(:commit, :created_at => 1.day.ago)
      FactoryGirl.create(:commit, :created_at => 1.day.ago)
      FactoryGirl.create(:commit, :created_at => 3.days.ago)
      FactoryGirl.create(:commit, :created_at => 4.days.ago)

      result = Commit.daily_commits(4)

      result[0]['count'].should equal(1)
      result[1]['count'].should equal(2)
      result[2]['count'].should equal(0)
      result[3]['count'].should equal(1)
    end
  end
end
