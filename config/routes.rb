Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root to: "pages#dashboard"

  resources :tasks do
    resources :nfcs, only: [:index, :new, :create, :destroy]
    resources :steps, only: [:create, :update, :destroy, :show] do
      member do
        get :move
      end
    end
    resources :employee_tasks, only: [:index, :new, :create, :destroy, :update]
  end

  get "employees", to: "users#index"
  get "employees/:id", to: "users#show", as: :employee

  get "/404", to: "errors#not_found", via: :all
  get "/500", to: "errors#internal_server_error", via: :all
end
