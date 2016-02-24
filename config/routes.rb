Rails.application.routes.draw do
  devise_for :users
  root "questions#index"
 resources :relations
 resources :users, only: [:show, :edit, :update, :index]

 resources :questions do
 resources :likes, only: [:create, :destroy]
 resources :answers, only: [:new, :create]
 resources :questions, only: [:create, :show]

end

end


