Rails.application.routes.draw do
resources :users_content, only: [:mypage, :show, :create, :edit, :update, :destroy]
resources :post_contents
  devise_for :admins
  devise_for :users
  root to: "homes#top"
  get 'homes/about'
  get "search" => "searches#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
