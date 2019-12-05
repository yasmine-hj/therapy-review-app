Rails.application.routes.draw do
  get 'therapy_groups/grouped_ratings', to: 'therapy_groups#ratings'
  resources :reviews
  resources :therapy_specialties
  resources :therapy_groups do
    resources :reviews, only: [:new, :index]
  end
  devise_for :users, :controllers => {registrations: 'registrations' }
  
  root to: 'application#welcome'


end
