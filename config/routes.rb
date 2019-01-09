Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  root :to => "users#top"
  get 'users/:id/mypage' => "users#mypage", as: "users_mypage"

  resources :users, only:[:index, :show, :edit, :update, :destroy]
  resources :admins, only:[:index]
  resources :messages, only:[:new, :index]
  resources :corrections, only:[:new, :create]
  resources :illustrations, only:[:new, :create, :show, :edit, :update, :destroy, :index]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
