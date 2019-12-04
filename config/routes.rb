Rails.application.routes.draw do
  
  resources :therapy_specialties
  resources :therapy_groups
  resources :reviews
  devise_for :users, :controllers => {registrations: 'registrations'}
  root to: 'application#welcome'

end
