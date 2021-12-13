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
  
end
