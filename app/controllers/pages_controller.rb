class PagesController < ApplicationController
  def index
    redirect_to current_user if current_user.present? && current_user.commits.count > 0
  end
end