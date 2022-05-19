Rails.application.routes.draw do
  root 'stores#index'
  namespace :api do
    namespace :v1, defaults: { format: :json } do
        resources :book_inventory
    end
  end
  resources :books
  resources :stores
end
