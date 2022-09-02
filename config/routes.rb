Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root to: "pages#dashboard"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :tasks do
    resources :nfcs, only: [:index, :new, :create, :destroy]
    resources :steps, only: [:create, :update, :destroy]
    resources :employee_tasks, only: [:index, :new, :create, :destroy]
  end

  # Defines the root path route ("/")
  # root "articles#index"

  get "employees", to: "users#index"
  get "employees/:id", to: "users#show", as: :employee
end
