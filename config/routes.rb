Rails.application.routes.draw do

  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  get "/lf" => "li_fei#index"

  get "/zjb" => "jian_bin#index"

  get "/szq" => "szq_shan#index"

  get "/sessions/new" => "szq_page#new"

  post "/sessions/create" => "szq_page#create"

  get "/szqadminadduser/new" => "szq_admin_adduser#new"

  post "/szqadminadduser/create" => "szq_admin_adduser#create" 

  get "/szqadminadduser/update" => "szq_admin_adduser#update" 

  # get "/szqadminadduser/update" => "szq_admin_adduser#update" 

  


  # post "/szqadminadduser/update" => "szq_admin_adduser#update"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'szq_shan#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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
  get '/libochao'=> "lbc#show"
  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
