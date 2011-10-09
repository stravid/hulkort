class User < ActiveRecord::Base
  include Clearance::User
  before_create :generate_api_key

  attr_accessible :time_zone, :email, :password
  validates :api_key, :uniqueness => true

  private
  def generate_api_key
    self.api_key = Digest::SHA1.hexdigest(Time.now.to_s + rand(12341234).to_s)[1..24]
  end

end