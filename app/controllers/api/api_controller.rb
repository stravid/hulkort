class Api::ApiController < ApplicationController
  before_filter :authorize
  skip_before_filter :ensure_domain

  private
  def authorize
    if params[:api_key].present?
      @user = User.find_by_api_key(params[:api_key])

      return true if @user.present?
    end

    head :error
  end
end