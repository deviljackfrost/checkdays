Rails.application.routes.draw do
  devise_for :users
scope module: :public do
    root to: "homes#top"
  get 'homes/about'
  get "search" => "searches#search"
  resources :users_content, only: [:mypage, :show, :create, :edit, :update, :destroy]
  resources :post_contents do
  resources :post_comments
end
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  

 end
 
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
