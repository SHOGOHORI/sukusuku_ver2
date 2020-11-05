Rails.application.routes.draw do
  root 'home_pages#home'
  get  '/help', to: 'home_pages#help'
  get  '/privacy', to: 'home_pages#privacy'

  devise_for :users, controllers: {
    registrations: 'devise/registrations',
    sessions: 'devise/sessions'
  }
  get  '/signup', to: 'devise/registrations#new'
  get  '/login', to: 'devise/sessions#new'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
