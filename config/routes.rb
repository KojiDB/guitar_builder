Rails.application.routes.draw do
  devise_for :builders, controllers: {
    sessions:        'builders/sessions',
    passwords:       'builders/passwords',
    registrations:   'builders/registrations'
  }
  devise_for :users, controllers: {
    sessions:        'users/sessions',
    password:        'users/passwords',
    registrations:   'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
