class User < ActiveRecord::Base
  include Clearance::User

  attr_accessible :time_zone, :email, :password
end