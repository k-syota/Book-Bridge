Rails.application.routes.draw do
  devise_for :users
  resources :users, only:[:index, :show, :edit, :update, :favorite]
  get "users/:id/favorites", to: "users#favorite", as: :favorite
  resources :books, only:[:new, :create, :index, :show] do
    resources :reviews, only:[:create, :show, :edit, :update, :destroy]
    resource :favorites, only:[:create, :destroy]
  end
  get "book_search", to:"books#search"
  post "book_search", to:"books#search"
  resources :authors, only:[:create]
  get "search", to: "search#search"
  get "about", to: "homes#about"
  root 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
