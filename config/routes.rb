Hulkort::Application.routes.draw do
  resources :users, :only => [:edit, :update]

  root :to => 'high_voltage/pages#show', :id => 'index'
end
