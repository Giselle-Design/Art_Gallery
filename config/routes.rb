Rails.application.routes.draw do

  get "/", to: "welcome#root", as: 'root'

  resources :arts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get("/home", to: "welcome#home")
end
