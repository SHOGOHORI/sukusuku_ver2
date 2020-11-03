Rails.application.routes.draw do
  root 'home_pages#home'
  get 'home_pages/help'
  get 'home_pages/privacy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
