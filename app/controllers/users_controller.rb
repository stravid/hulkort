class UsersController < ApplicationController
  def edit
  end

  def show
    @commits = current_user.commits.order(:created_at).reverse_order
  end

  def update
    current_user.update_attributes(params[:user])

    redirect_to :action => :edit
  end
end
