class ApplicationController < ActionController::Base
  include Clearance::Authentication
  protect_from_forgery

  before_filter :set_user_time_zone

  private
  def set_user_time_zone
    Time.zone = current_user.time_zone if signed_in?
  end
end
