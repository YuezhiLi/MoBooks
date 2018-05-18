Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/:user_id/books', to: "books#index"
      post '/login', to: "login#login"
      get 'my_books', to: 'books#my_books'
      get 'search/:keyword', to: 'books#search'
      resources :books do
        resources :events, only: [:show, :create, :update] do
          resources :reviews, only: [:create, :update, :show, :destroy]
        end
      end

    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
