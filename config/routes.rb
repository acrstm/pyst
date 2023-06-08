Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :groups do
    collection do
      get :join
      post :join_group
    end
    resources :tasks, only: [:index, :new, :create, :show] do
      member do
        patch :progress
        patch :finish_task

      end
    end

    resources :shopping_lists, only: [:index, :new, :create, :show] do
      collection do
        get :new_item
      end
    end
    resources :bought_items, only: [:index, :new, :create, :show]
    resources :fixed_costs, only: [:index, :new, :create, :show]
  end
  get "options", to: "pages#options"
  get "usertasks/:id", to: "tasks#userstasks", as: "usertasks"
  # get "groups/:group_id", to: "shopping_lists#new_item", as: "newitem"
end
