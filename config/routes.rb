Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # scope path: "api" do
  #   resources :profiles 
  #   resources :reverse_look_ups 
  #   resources :searches 
  #   resources :feedback 
  # end


end
