Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  devise_for :users, :controllers => {:sessions => 'sessions'}
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :users

  scope path: "api" do
    resources :profiles
    resources :reverse_look_ups
    resources :searches
    resources :feedbacks
    resources :word_lists
  end


end
