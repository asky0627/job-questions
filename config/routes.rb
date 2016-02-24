Rails.application.routes.draw do
  devise_for :users
 resources :relations
 resources :users, only: [:show, :edit, :update, :index]
 root "questions#index"
 resources :questions do
 resources :answers, only: [:new, :create]
 end
 resources :questions, only: [:create, :show]
 resources :users, only: :show

end

