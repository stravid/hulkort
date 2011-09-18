Hulkort::Application.routes.draw do
  resources :users

  root :to => 'high_voltage/pages#show', :id => 'index'
end
