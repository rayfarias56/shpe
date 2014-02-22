SampleApp::Application.routes.draw do

  # Announcements
  resources :announcements

  # Resumes
  resources :resumes

  # Users
  match 'users/group/:group', to: 'users#group_index', as: :group_index
  match '/signup',  to: 'users#new'
  match '/admin_tools/:id', to: 'users#admin_tools', as: :admin_tools
  match 'view_user/:id', to: 'users#view_user', as: :view_user
  match 'users/:id/settings', to: 'users#settings', as: :user_settings
  match 'users/:id/set_alumnus', to: 'users#set_alumnus', as: :set_alumnus
  resources :users


  # Sessions
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  # Password resets
  resources :password_resets
  get "password_resets/new" , as: :new_password_reset

  
  # Static Pages
  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about' , as: :about
  match '/sponsor',   to: 'static_pages#sponsor' , as: :sponsor
  match '/contact', to: 'static_pages#contact', as: :contact
  match '/event_list', to: 'static_pages#events', as: :event_list
  match '/resources', to: 'static_pages#resources', as: :resources
  match '/members', to: 'static_pages#members', as: :members
  match '/constitution', to: 'static_pages#constitution', as: :constitution
  match '/executive_board', to: 'static_pages#execboard', as: :execboard

  # Events
  resources :events
  match '/event_choices', to: 'events#event_choices', as: :event_choices
  match '/event_registration', to: 'events#event_registration', as: :event_registration
  match '/user_attendance/:id', to: 'events#user_attendance', as: :user_attendance
  match '/leaderboard', to: 'events#leaderboard', as: :leaderboard





  # Event Users
  resources :event_users


  root to: 'static_pages#home'
  ActiveAdmin.routes(self)

  # Catch unroutable paths and send to the routing error handler
  match '*a', :to => 'home#routing_error'
end
