Rails.application.routes.draw do
  
  resources :therapy_specialties
  resources :therapy_groups do
    resources :reviews, only: [:new, :index]
  end
  resources :reviews
  devise_for :users, :controllers => {registrations: 'registrations'}
  root to: 'application#welcome'

end
