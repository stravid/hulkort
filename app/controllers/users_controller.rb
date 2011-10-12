class UsersController < ApplicationController
  def edit
  end

  def show
    @time_limit = 30
    @commits = current_user.commits.limit_time_to(@time_limit.days.ago).order(:created_at).reverse_order
  end

  def update
    current_user.update_attributes(params[:user])

    redirect_to :action => :edit
  end
end
