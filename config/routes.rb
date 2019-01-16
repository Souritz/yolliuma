Rails.application.routes.draw do
# deviseのパス設定
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  devise_for :users, controllers: {
  sessions: 'users/sessions',
  passwords: 'users/passwords',
  registrations: 'users/registrations'
}

# ルートパス設定
  root :to => "users#top"
# マイページurl個別設定
  get 'users/:id/mypage' => "users#mypage", as: "users_mypage"

# その他のパス設定
  resources :users, only:[:index, :show, :edit, :update, :destroy]
  resources :admins, only:[:index]
  resources :messages, only:[:new, :index]
  resources :corrections, only:[:new, :create]
  resources :illustrations, only:[:new, :create, :show, :edit, :update, :destroy, :index]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
