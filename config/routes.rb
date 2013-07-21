SampleApp::Application.routes.draw do
  resources :announcements


  resources :resumes


  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  

  
  
  match '/signup',  to: 'users#new'
  match '/control_panel', to: 'users#control_panel'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  
  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
  match '/mission', to: 'static_pages#mission'
  match '/meeting', to: 'static_pages#meeting'
  match '/history', to: 'static_pages#history'
  match '/constitution', to: 'static_pages#constitution'
  match '/regioniv', to: 'static_pages#regioniv'
  match '/national', to: 'static_pages#national'
  match '/documentary', to: 'static_pages#documentary'
  match '/events', to: 'static_pages#events', as: :events

  match 'add_admin/:id', to: 'users#add_admin'
  match 'remove_admin/:id', to: 'users#remove_admin'

  match 'add_eboard/:id', to: 'users#add_eboard'
  match 'remove_eboard/:id', to: 'users#remove_eboard'

  match 'add_company/:id', to: 'users#add_company'
  match 'remove_company/:id', to: 'users#remove_company'

  match 'view_user/:id', to: 'users#view_user', as: :view_user
  match 'view_resumes_list', to: 'resume_views#index', as: :view_resumes_list

  root to: 'static_pages#home'

  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
