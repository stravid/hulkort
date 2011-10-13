class PagesController < ApplicationController
  def index
    unless params[:ignore_commits].present?
      redirect_to current_user if current_user.present? && current_user.commits.count > 0
    end
  end
end