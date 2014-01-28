SampleApp::Application.routes.draw do

  get "password_resets/new"

  resources :announcements
  resources :resumes


  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets 
  
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  
  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about' , as: :about
  match '/contact', to: 'static_pages#contact', as: :contact
  match '/event_list', to: 'static_pages#events', as: :event_list
  match '/event_choices', to: 'events#event_choices', as: :event_choices
  match '/event_registration', to: 'events#event_registration', as: :event_registration
  match '/user_attendance/:id', to: 'events#user_attendance', as: :user_attendance
  match '/resources', to: 'static_pages#resources', as: :resources
  match '/members', to: 'static_pages#members', as: :members
  match '/constitution', to: 'static_pages#constitution', as: :constitution
  match '/executive_board', to: 'static_pages#execboard', as: :execboard
  match 'add_admin/:id', to: 'users#add_admin'
  match 'remove_admin/:id', to: 'users#remove_admin'

  match 'add_eboard/:id', to: 'users#add_eboard'
  match 'remove_eboard/:id', to: 'users#remove_eboard'

  match 'add_company/:id', to: 'users#add_company'
  match 'remove_company/:id', to: 'users#remove_company'

  match 'view_user/:id', to: 'users#view_user', as: :view_user
  match 'view_resumes_list', to: 'resume_views#index', as: :view_resumes_list

  resources :events
  resources :event_users
  root to: 'static_pages#home'
  ActiveAdmin.routes(self)
end
