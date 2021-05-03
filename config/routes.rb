Rails.application.routes.draw do

  resources :user_docs do
    get 'search', on: :collection
  end

  resources :support_requests do
    get 'search', on: :collection
  end

  devise_for :users
  resources :users do
    get 'search', on: :collection
  end
  
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
