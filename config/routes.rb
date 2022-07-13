Rails.application.routes.draw do
  root "games#index"

  resources :users, only: %i[new create]
  resource :session, only: %i[destroy]
  resources :sessions, only: %i[new create]
  resources :reviews, only: %i[new create]
  get 'products/bought' => 'products#bought'
  get 'products/sold' => 'products#sold'
  get 'products/:id/translationp' => 'products#translationp'
  get 'products/:id/translation' => 'products#translation'
  get 'messages' => 'products#message_all'


  resources :games, shallow: true, only: %i[new create index] do
    resources :services, shallow: true, only: %i[create new show] do
      resources :products, shallow: true, only: %i[create new show edit update] do
        resources :reviews, shallow: true, only: %i[create new show]
        resources :transactions, shallow: true, only: %i[create new show]
        resources :messages, shallow: true, only: %i[create new show]
        resources :chats, shallow: true, only: %i[create new show index]
      end
    end
  end
end
