Rails.application.routes.draw do
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  get 'errors/not_found'
  get 'errors/internal_server_error'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root to: "pages#dashboard"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :tasks do
    resources :nfcs, only: [:index, :new, :create, :destroy]
    resources :steps, only: [:create, :update, :destroy]
    resources :employee_tasks, only: [:index, :new, :create, :destroy, :update]
  end

  # Defines the root path route ("/")
  # root "articles#index"

  get "employees", to: "users#index"
  get "employees/:id", to: "users#show", as: :employee
end
