Rails.application.routes.draw do
  resources :comments
  mount Ckeditor::Engine => '/ckeditor'
  get 'home/index'
  root 'home#index'


  resources :stories do
    resources :comments, module: :stories
  end
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
  get 'write-story' => 'user_profile#write_story'
  delete 'destroy_user'=> 'admin_sections#destroy_user'

  get 'list-stories' => 'admin_sections#list_stories'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
