require 'sidekiq/web'
require 'sidekiq-status/web'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Sidekiq::Web => '/sidekiq'

  root 'object_states#index'

  resources :object_states, only: [:index, :new, :create]

end
