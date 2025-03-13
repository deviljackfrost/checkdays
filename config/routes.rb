Rails.application.routes.draw do

  devise_for :admins
resources :users_content, only: [:mypage, :show, :create, :edit, :update, :destroy]
resources :post_contents
  devise_for :users
  root to: "homes#top"
  get 'homes/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
