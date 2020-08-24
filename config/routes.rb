Rails.application.routes.draw do

  get "/", to: "welcome#root", as: 'root'
  get("/home", to: "welcome#home")
  get("/museum", to: "welcome#museum")

  resources :arts do
  resources :comments, only: [:create, :destroy]
  end


  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]

end
