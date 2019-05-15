Rails.application.routes.draw do
  resources :movies, only: [:index, :show, :create]
  # get "movies/index"
  # get "movies/show"
  # get "movies/create"
  resources :customer, only: [:index, :show, :create]
  

  get "movies/zomg"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
