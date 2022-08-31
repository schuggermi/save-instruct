Rails.application.routes.draw do
<<<<<<< HEAD

  devise_for :users
=======
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

>>>>>>> f6006f849eeaf3424a0f0140503cdec9c6a85ede
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
end
