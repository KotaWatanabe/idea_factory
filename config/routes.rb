Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only:[:new, :create]
  resource :session, only:[:new, :create, :destroy]
  resources :ideas, except: [:index] do
    resources :reviews, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  get("/", { to: 'ideas#index', as: 'root' })
end
