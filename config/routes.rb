Rails.application.routes.draw do
  get 'search/search'
  root 'home_pages#home'
  get '/help', to: 'home_pages#help'
  get '/privacy', to: 'home_pages#privacy'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :users, only: [:update, :show]
  get 'users/:id/profile_register', to: 'users#profile_create', as: 'profile_create'
  delete 'users/:id/delete_avater', to: 'users#delete_avater', as: 'user_delete_avater'

  resources :children
  delete 'children/:id/delete_avater', to: 'children#delete_avater', as: 'child_delete_avater'

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
  resources :vote_comments, only: [:create, :destroy]
end
