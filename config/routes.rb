Rails.application.routes.draw do
  resources :books do
    resources :events, only: [:show, :create, :update]
  end
  root to: 'books#index'
  get 'my_books', to: 'books#my_books'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
