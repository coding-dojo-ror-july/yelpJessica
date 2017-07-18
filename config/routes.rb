Rails.application.routes.draw do
  root 'users#index'
  post 'users' => 'users#create'
  post 'users/authenticate' => 'users#authenticate'
  get 'logout' => 'users#logout'
  get 'restaurants/show' => 'restaurants#show'
  get 'restaurants/new' => 'restaurants#new'
  post 'restaurants/create' => 'restaurants#create'
  get 'restaurants/:id/ratings/new' => 'ratings#new'
  post 'restaurants/:id/ratings/:user_id/create' => 'ratings#create'
end
