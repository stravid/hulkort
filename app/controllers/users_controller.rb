class UsersController < ApplicationController
  def edit
  end

  def show
    @time_limit = 30
    @commits = current_user.commits.limit_time_to(@time_limit.days.ago).order(:created_at).reverse_order

    @user_commit_count = current_user.commits.count
    @user_daily_commits = current_user.commits.daily_commits.reverse
    @global_commit_count = Commit.count
    @global_daily_commits = Commit.daily_commits.reverse
  end

  def update
    current_user.update_attributes(params[:user])

    redirect_to :action => :edit
  end
end
