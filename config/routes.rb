Rails.application.routes.draw do
  devise_for :users
  root to: "pages#dashboard"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :task do
    resources :nfcs, only: [:index, :new, :create, :destroy]
    resources :steps, only: [:create, :update, :destroy]
    resources :employee_tasks, only: [:index, :new, :create, :destroy]
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
