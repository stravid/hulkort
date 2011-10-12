class Commit < ActiveRecord::Base
  belongs_to :user
  scope :limit_time_to, lambda { |timestamp| where('created_at >= ?', timestamp) }
end
