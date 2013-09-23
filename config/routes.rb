Kingraveninsults::Application.routes.draw do
  get "users/new"

  get "users/create"

  get "users/destroy"

  get "users/edit"

  get "users/update"

  root to: "StaticPages#index"
end
