Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#index"
  get "/spells", to: "spells#index"
  post "/spells", to: "spells#create"
  get "/spells/:id", to: "spells#show"
  put "/spells/:id", to: "spells#update"

end
