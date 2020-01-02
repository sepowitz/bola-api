Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :standings, only: [:show]
  resources :competitions, only: [:index]
  resources :teams, only: [:index]

  # results :show
  # fixtures :show
end
