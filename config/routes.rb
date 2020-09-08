Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get "/", to: "welcome#root", as: 'root'
  get("/home", to: "welcome#home")
  get("/museum", to: "welcome#museum")

  resources :arts do
  resources :likes, shallow: true, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  get :liked, on: :collection
  end


  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]

 # (namespace decorates path) add PATH before arts like api/v1/arts  | api/v1/arts/:id
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :arts
    end
  end

end
