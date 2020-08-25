Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#followed', as: 'follows'
    get 'followers' => 'relationships#follower', as: 'followers'
    get 'leave', :on => :collection
  end

  resources :posts do
  	resource :favorites, only: [:create, :destroy]
    post "bookmarks" => 'bookmarks#create'
    delete '/bookmarks' => 'bookmarks#destroy'
  end

  root to: 'home#top'
  get 'home/about' => 'home#about'
  get 'home/index' => 'home#index'
  get 'users/leave' => 'users#leave', as: 'leave'
  get 'bookmarks' => 'bookmarks#index', as: 'bookmarks'


end