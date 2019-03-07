Rails.application.routes.draw do
  resources :courses
  resources :state
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root :to => "courses#index"
  root :to => "userfacade#userhandler"
  # get 'courses', to: 'courses#index', as: 'coursess'
  get '/homepage', to: 'userfacade#homepage', as: 'homepage'
  get '/userlists', to: 'state#userlists', as: 'userlists'
  get '/useredit', to: 'state#show', as: 'edits'

  post '/state_change', to: 'courses#change_state'

end
