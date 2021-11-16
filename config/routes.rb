Rails.application.routes.draw do

  resources :user_docs do
    get 'search', on: :collection
  end

  resources :support_requests do
    get 'search', on: :collection
  end

  namespace :admin do
    resources :users, only: %i[edit update] do
      get :assign_supporting_doc
      post :assign_doc
      collection do
        get :new_support_req_type
        post :create_support_req_type
        get :new_document_type
        post :create_document_type
      end
    end
  end

  devise_for :users
  resources :users do
    get 'search', on: :collection
  end

  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
