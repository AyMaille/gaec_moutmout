Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :fields, only: %i[index show new create] do
    resources :sheeps, only: %i[new create]
  end
  resources :sheeps, only: %i[index show update] do
    resources :comments, only: %i[new create]
  end
  resources :lots, only: %i[index show new create edit update]
  resources :corner_positions, only: [:create]
end
