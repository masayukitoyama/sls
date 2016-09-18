Rails.application.routes.draw do
  namespace :api, { format: 'json' } do
    post 'users' => 'users#create'
    put  'user/:id' => 'users#update'
    post 'likes' => 'likes#create'
    post 'requires' => 'requires#create'
  end

  # 利用者一覧
  get 'users' => 'users#index', as: 'users'

  # 書籍
  get 'books' => 'books#index', as: 'books'
  get 'book/new' => 'books#new', as: 'book_new'
  get 'book/search' => 'books#search', as: 'book_search'
  get 'book/:id' => 'books#show', as: 'book_detail'
  post 'books' => 'books#create', as: 'book_create'

  # 貸出
  get 'borrow_histories' => 'borrow_histories#index', as: 'borrow_histories'
  post 'borrow' => 'borrow_histories#create', as: 'borrow_history_create'
  put 'borrow/:id' => 'borrow_histories#update', as: 'borrow_history_update'

  # ランキング
  get 'borrow/ranking' => 'borrow_histories#ranking', as: 'borrow_hisotory_ranking'

  devise_for :users, :controllers => {
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    sessions: 'users/sessions'
  }

  root to: 'books#index'
  get '*path', controller: 'application', action: 'render_404'
end
