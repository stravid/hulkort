Hulkort::Application.routes.draw do
  resources :users, :only => [:edit, :update]

  namespace :api do
    resources :commits, :only => [:create]
  end

  root :to => 'high_voltage/pages#show', :id => 'index'
end
