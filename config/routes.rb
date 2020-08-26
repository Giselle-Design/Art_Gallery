Rails.application.routes.draw do

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

end
