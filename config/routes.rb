Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'


  resources :stories
  resources :contests
  resources :rules
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }
  resources :categories
  resources :countries
  get 'list-users' => 'admin_sections#list_users'
  get 'dashboard' => 'admin_sections#dashboard'
  get 'my-profile' => 'user_profile#user_profile'
  delete 'destroy_user'=> 'admin_sections#destroy_user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
