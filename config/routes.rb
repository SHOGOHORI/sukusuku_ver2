Rails.application.routes.draw do
  root 'home_pages#home'
  get '/help', to: 'home_pages#help'
  get '/privacy', to: 'home_pages#privacy'
  get 'votes/new'
  get 'votes/show'
  get 'votes/edit'
  get 'consultation_comment/new'
  get 'consultation_comment/create'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :users, only: [:update, :show]
  get 'users/:id/profile_register', to: 'users#profile_create', as: 'profile_create'

  resources :children
  resources :consultations do
    member do
      post 'reception_closed', to: 'consultations#reception_closed'
    end
  end
  resources :consultation_comment, only: [:create, :destroy]
  resources :consultation_comment_reply, only: [:create, :destroy]

  resources :votes
  resources :vote_items, only: [:create, :destroy]
  resources :vote_relationships, only: [:create, :destroy]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
