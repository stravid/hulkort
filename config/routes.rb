Hulkort::Application.routes.draw do
  resources :users, :only => [:edit, :update, :show]

  namespace :api do
    resources :commits, :only => [:create]
  end

  root :to => 'pages#index'
end
