Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'links#index'

  resources :links, only: [:index, :create, :show]
  get ':unique_id', to: 'links#show'
end
