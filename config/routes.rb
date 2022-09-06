Rails.application.routes.draw do
  devise_for :users, path: "/employees", path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register'
  }, controllers: {
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
    resources :employee_tasks, path: "/assigned-employees", only: [:index, :new, :create, :destroy, :update], path_names: {
      new: 'update'
    }
  end
    # resources :users, only: [:index, :show, :edit, :update, :destroy]
  get "employees", to: "users#index"
  get "employees/:id", to: "users#show", as: :employee
  get "employees/:id/edit", to: "users#edit", as: "edit_employee"
  patch "employees/:id", to: "users#update", as: "employee_update"
  delete "employee/:id", to: "users#destroy", as: "employee_destroy"

  get "/404", to: "errors#not_found", via: :all
  get "/500", to: "errors#internal_server_error", via: :all
end
