Rails.application.routes.draw do
  get 'searches/search'
  devise_for :users
  resources :users, only:[:index, :show, :edit, :update]
  resources :books, only:[:new, :create, :index, :show] do
    resources :reviews, only:[:create, :show, :edit, :update, :destroy]
    resource :favorites, only:[:create, :destroy]
  end
  resources :authors, only:[:create]
  get "search", to: "search#search"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
