class Api::RepositoriesController < Api::ApiController

  def create

    if params[:name].nil?
      response = {
        :error => {:code => 400, :message => "Parameter 'name' is required!"}
      }
      render :json => response, :status => :bad_request and return
    end
    
    @repository = @user.repositories.new(:name => params[:name])
    if @repository.save
      response = {
        :id => @repository.id,
        :name => @repository.name,
        :shortcode => @repository.shortcode
      }

      render :json => response, :status => :created
    else
      response = {
        :error => {
          :code => 400,
          :message => "The repository named '#{params[:name]}' already exists for this api key!"
        }
      }
      render :json => response, :status => :bad_request
    end
  end

end
