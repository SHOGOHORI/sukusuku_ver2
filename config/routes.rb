Rails.application.routes.draw do
  get 'users/show'
  get 'users/update'
  root 'home_pages#home'
  get  '/help', to: 'home_pages#help'
  get  '/privacy', to: 'home_pages#privacy'

  resources :users, only: [:update]
  get '/mypage/:id', to: 'users#show', as: 'mypage'
  get 'users/:id/profile', to:'users#profile_create', as: 'profile_create'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
