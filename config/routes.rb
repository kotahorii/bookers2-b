Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  get 'search' => 'searches#search'
  resources :users,only: [:show,:index,:edit,:update] do
     resources :relationships, only: [:create, :destroy]
     get 'follow' => 'relationships#follow'
     get 'follower' => 'relationships#follower'
  end
  resources :books do
  resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
  end
end