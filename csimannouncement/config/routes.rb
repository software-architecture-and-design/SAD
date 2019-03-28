Rails.application.routes.draw do
  resources :announcements
  get 'announcements/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'announcements#index'
end
