Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :index]
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  root 'books#top'
  get '/home/about' => 'books#about', as: :about
end
