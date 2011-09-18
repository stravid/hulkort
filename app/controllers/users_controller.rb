class UsersController < ApplicationController
  def edit
  end

  def update
    current_user.update_attributes(params[:user])

    redirect_to :action => :edit
  end
end
