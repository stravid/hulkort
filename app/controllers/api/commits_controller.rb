class Api::CommitsController < Api::ApiController
  def create
    @user.commits.create
    
    head :ok
  end
end
