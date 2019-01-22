Rails.application.routes.draw do
  get 'like_users/create'
  get 'like_users/destroy'
  get 'like_illustrations/create'
  get 'like_illustrations/destroy'
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
  # 一人のユーザーに複数のメッセージ・お気に入りがつくためネスト
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    resource :like_users, only: [:create, :destroy]
    resources :messages, only: [:new, :index]
  end
  resources :admin, only: [:index]

  # 一つのイラストに複数の添削内容・お気に入りがつくためネスト
  resources :illustrations, only: [:new, :create, :show, :edit, :update, :destroy, :index] do
    resource :like_illustrations, only: [:create, :destroy]
    resources :corrections, only: [:create, :destroy, :show]
    resources :tag_lists, only: [:create, :destroy]
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
