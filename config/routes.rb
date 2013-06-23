Hulkort::Application.routes.draw do
  root to: 'pages#index'

  resources :users, only: [:edit, :update, :show]

  namespace :api do
    resources :commits, only: [:create]
    resources :repositories, only: [:create]
  end

  get 'graphs/:shortcode', to: 'graphs#show', as: :graph

  # Define the 'as:' option different from the named route that clearance provides
  # to prevent a naming conflict
  delete '/sign_out', to: 'sessions#destroy', as: :signout
end
