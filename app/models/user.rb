class User < ActiveRecord::Base
  include Clearance::User
  # use before_validation because before_create somehow breaks uniqueness in test env
  before_validation :generate_api_key, :on => :create

  attr_accessible :time_zone, :email, :password
  validates :api_key, :uniqueness => true

  has_many :commits
  has_many :repositories

  private

  def generate_api_key
    begin
      key = Digest::SHA1.hexdigest(Time.now.to_s + rand(12341234).to_s)[1..24]
    end until User.find_by_api_key(key).nil?
    
    self.api_key = key
  end

end