Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations',
  }

  devise_for :users, controllers: {
    sessions: 'user/sessions',
    passwords: 'user/passwords',
    registrations: 'user/registrations',
  }

  root 'homes#top'

  namespace :user, path: "" do
    resources :users, only: [:index, :show, :edit, :update] do
      get :likes, on: :collection
    end
    resources :bikes
    resources :posts
    resources :comments, only: [:create, :destroy]
    resources :rankings, only: [:index, :show]
  end

  namespace :admin do
    resources :bikes do
      resource :likes, only: [:create, :destroy]
    end
  end
end
