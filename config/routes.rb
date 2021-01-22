Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#index"
  get "/spells", to: "spells#index", as:"spells"
  post "/spells", to: "spells#create"
  get "/spells/new", to: "spells#new", as: "new_spell"
  get "/spells/:id", to: "spells#show", as: "spell"
  put "/spells/:id", to: "spells#update"
  delete "/spells/:id", to: "spells#destroy"
  
  

end
