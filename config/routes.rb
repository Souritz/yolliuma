Rails.application.routes.draw do
  get 'admins/index'
  get 'users/top'
  get 'users/mypage'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  get 'messages/new'
  get 'messages/index'
  get 'corrections/new'
  get 'corrections/create'
  get 'illustrations/new'
  get 'illustrations/create'
  get 'illustrations/show'
  get 'illustrations/edit'
  get 'illustrations/update'
  get 'illustrations/destroy'
  get 'illustrations/index'
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
