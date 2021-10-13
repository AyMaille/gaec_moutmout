Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :fields, only: [:show] do
    resources :sheeps, only: %i[new create]
  end
  resources :sheeps, only: %i[index show update]
end
