Rails.application.routes.draw do
  get "/404", to: "errors#not_found", via: :all
  get "/500", to: "errors#internal_server_error", via: :all

  root to: "pages#dashboard"

  devise_for :users, path: "/employees", path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register'
  }, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  get "employees", to: "users#index"
  get "employees/:id", to: "users#show", as: :employee
  get "employees/:id/edit", to: "users#edit", as: "edit_employee"
  patch "employees/:id", to: "users#update", as: "employee_update"
  delete "employee/:id", to: "users#destroy", as: "employee_destroy"

  resources :tasks do
    resources :nfcs, only: %w[new create destroy]
    resources :steps, only: %w[add create update destroy show] do
      member do
        get :move
      end
    end
    resources :employee_tasks, path: "/assigned-employees", only: %w[index new create destroy update], path_names: {
      new: 'update'
    }
  end
end
