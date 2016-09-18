Rails.application.routes.draw do
  namespace :api, { format: 'json' } do
    post 'users' => 'users#create'
    put  'user/:id' => 'users#update'
  end

  # 利用者一覧
  get '/users' => 'users#index', as: 'users'

  # 書籍
  get 'books' => 'books#index', as: 'books'
  get 'book/new' => 'books#new', as: 'book_new'
  get 'book/search' => 'books#search', as: 'book_search'
  get 'book/:id' => 'books#show', as: 'book_detail'
  post 'books' => 'books#create', as: 'book_create'

  # 貸し出し
  get '/borrow_histories' => 'borrow_histories#index', as: 'borrow_histories'
  get '/borrow/:id' => 'borrow_histories#new', as: 'borrow_history_new'
  post '/borrow' => 'borrow_histories#create', as: 'borrow_history_create'
  put '/borrow/:id' => 'borrow_histories#update', as: 'borrow_history_update'

  devise_for :users, :controllers => {
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    sessions: 'users/sessions'
  }

  root to: 'books#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
