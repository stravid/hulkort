class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery

  before_filter :set_user_time_zone
  before_filter :ensure_domain

  private
  def set_user_time_zone
    Time.zone = current_user.time_zone if signed_in?
  end

  def ensure_domain
    if request.env['HTTP_HOST'] == 'hulkort.herokuapp.com'
      redirect_to "http://www.hulkort.com", status: 301
    end
  end
end
