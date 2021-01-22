Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#index"
  get "/spells", to: "spells#index"
  # creare a route that brings up the form
  get "/spells/new", to:"spells#new"
  # creare a route that brings up the form to edit
  get "/spells/:id/edit", to:"spells#edit"
  post "/spells", to: "spells#create", as:"spells_create"
  get "/spells/:id", to: "spells#show", as:"spell"
  put "/spells/:id", to: "spells#update", as:"spell_update"

end
