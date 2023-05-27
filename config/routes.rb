Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :groups do
    collection do
      get :join
    end
    resources :tasks, only: [:index, :new, :create, :show]
    resources :shopping_lists, only: [:index, :new, :create, :show]
    resources :fixed_costs, only: [:index, :new, :create, :show]
  end



  get "options", to: "pages#options"
  # get  "group", to: "groups#show"

end
