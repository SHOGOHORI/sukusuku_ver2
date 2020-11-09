Rails.application.routes.draw do
  root 'home_pages#home'
  get  '/help', to: 'home_pages#help'
  get  '/privacy', to: 'home_pages#privacy'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users, only: [:update, :show]
  get 'users/:id/profile_register', to:'users#profile_create', as: 'profile_create'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
