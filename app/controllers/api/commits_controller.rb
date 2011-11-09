class Api::CommitsController < Api::ApiController
  def create
    if params[:repository].present?
      repository = @user.repositories.find_by_id(params[:repository])

      if params[:repository].present? && repository.present?
        commit = @user.commits.create(:repository_id => repository.id)
      else
        head :error and return
      end
    else
      @user.commits.create
    end

    head :ok
  end
end
