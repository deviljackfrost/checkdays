Rails.application.routes.draw do
  scope module: :public do
    devise_for :users
    resources :groups do
      member do
        get  'members'
        post 'update_status'
        post 'join'
        post 'leave'
      end
    end
    post 'groups/create'
    resource :group_users, only: [:create, :edit, :destroy, :update]
  end

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

  namespace :admin do
    get 'groupall', to: 'group_all#index'
    get 'dashboards', to: 'dashboards#index'
    get 'postall', to: 'post_all#index'
    get 'commentall', to: 'comment_all#index'

    resources :users, only: [:destroy]
    resources :post_contents, only: [:destroy]
    resources :post_comments, only: [:destroy]
    resources :group, only: [:destroy]
  end
end