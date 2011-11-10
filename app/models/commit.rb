class Commit < ActiveRecord::Base
  belongs_to :user
  belongs_to :repository
  scope :limit_time_to, lambda { |timestamp| where('created_at >= ?', timestamp) }

  def self.daily_commits(number = 30)
    commits_by_date = Commit.where('created_at >= ?', number.days.ago).group_by { |commit| commit.created_at.strftime('%Y%m%d') }

    result = number.times.map do |day|
      date = day.days.ago.strftime('%Y%m%d')
      count = commits_by_date[date].present? ? commits_by_date[date].count : 0

      { "date" => date, "count" => count }
    end
  end
end
