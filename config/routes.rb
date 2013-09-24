Kingraveninsults::Application.routes.draw do
  match "/info" => "static_pages#info"
  match "/classic" => "static_pages#classic"
  root to: "StaticPages#index"
end
