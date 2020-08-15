Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :edit, :update]
  resources :bookmarks, only: [:index, :create, :destroy]

  resources :posts do
  	resource :favorites, only: [:create, :destroy]
  end

  root to: 'home#top'
  get 'home/about' => 'home#about'
  get 'home/index' => 'home#index'

end