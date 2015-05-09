Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]

  resources :users do
    resources :reviews
  end

  get '/profiles/:id', to: 'users#show'
  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  get 'signout' => 'sessions#destroy'
  get 'signup' => 'users#new'

  get 'profile', to: 'users#current'

  get 'review_trips/:id', to: 'trips#match_reviewer'
  get 'review_parcels/:id', to: 'parcels#match_reviewer'

  resources :parcels do
    resources :reviews
    resources :trips do
      get 'book', :on => :member
    end
  end

  resources :trips do
    resources :parcels
    resources :reviews
  end

 root to: 'application#index'

end