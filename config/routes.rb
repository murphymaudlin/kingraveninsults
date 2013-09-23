Kingraveninsults::Application.routes.draw do
  match "/classic" => "static_pages#classic"
  root to: "StaticPages#index"
end
