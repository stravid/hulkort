Hulkort::Application.routes.draw do
  resources :users, :only => [:edit, :update, :show]

  namespace :api do
    resources :commits, :only => [:create]
    resources :repositories, :only => [:create]
  end

  root :to => 'pages#index'

  match '/sign_out' => 'sessions#destroy', :via => :delete, :as => 'sign_out'
end
