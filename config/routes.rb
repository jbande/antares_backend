Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/products", to:"products#index"

  get "/products/add_image/:id", to:"products#add_image_form"

  #patch "/products/add_image/:id", to:"products#add_image", as:"product"
  post "/products/add_image/:id", to:"products#add_image", as:"product"

  get "/product/show/:id", to:"products#show", as:"show_product"


end
