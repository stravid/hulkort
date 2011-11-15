class GraphsController < ApplicationController
  def show
    if params[:shortcode].present?
      @repository = Repository.find_by_shortcode(params[:shortcode])
      unless @repository.nil?
        @repository_daily_commits = @repository.commits.daily_commits.reverse
      else
        render :status => 500
      end
    else
      render :status => 500
    end
  end
end