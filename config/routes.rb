Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:show] # ユーザーマイページへのルーティング

  resources :hobbies do
    resources:likes,only:[:create,:destroy] #create アクションと destroy アクションのみしか使わない
  end

  root 'hobbies#index'

    # ネストさせる
    resources :users do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end

    resources :rooms, only: [:show, :create, :index] do
      member do
        get 'inviting' => 'users#invite'
        post '/users/:user_id/entries' => 'entries#create', as: 'entries'
      end
    end
  

    delete 'rooms/:room_id/users/:user_id/entries' => 'entries#destroy', as: 'entry'

    resources :relationships, only: [:create, :destroy]
end
