class User < ActiveRecord::Base
  include Clearance::User
  # use before_validation because before_create somehow breaks uniqueness in test env
  before_validation :generate_api_key, :if => "self.new_record?"

  attr_accessible :time_zone, :email, :password
  validates :api_key, :uniqueness => true

  private

  def generate_api_key
    self.api_key = Digest::SHA1.hexdigest(Time.now.to_s + rand(12341234).to_s)[1..24]
    self.api_key = Digest::SHA1.hexdigest(Time.now.to_s + rand(12341234).to_s)[1..24] until User.find_by_api_key(api_key).nil?
  end

end