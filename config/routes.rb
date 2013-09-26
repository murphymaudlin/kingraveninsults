Kingraveninsults::Application.routes.draw do
  match "/complements" => "static_pages#complement"
  match "/info" => "static_pages#info"
  match "/classic" => "static_pages#classic"
  root to: "StaticPages#index"
end
