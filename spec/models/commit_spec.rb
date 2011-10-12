require 'spec_helper'

describe Commit do
  it { should belong_to(:user) }
  
  it "should limit creation time correctly" do
    7.times { Commit.create }
    @commit = Commit.first
    @commit.created_at = 10.days.ago
    @commit.save
    Commit.limit_time_to(9.days.ago).count.should equal(6)
  end

end
