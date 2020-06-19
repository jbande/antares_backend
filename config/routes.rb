Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  get "/backend", to:"backends#home"

  get 'static_text/index', to:'static_texts#index', as:'static_text_index'

  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/products", to:"products#index"

  get "/products/add_image/:id", to:"products#add_image_form"

  patch "/products/add_image/:id", to:"products#add_image", as:"product"
  #post "/products/add_image/:id", to:"products#add_image", as:"product"

  get "/product/show/:id", to:"products#show", as:"show_product"

  get "/product/images/:id", to:"products#get_images", as:"get_product_images"




  get "/static_image", to:"static_images#index"#, as: "static_image"

  get "/static_image/new", to:"static_images#new"#, as: "static_image"

  post "/static_image/create", to:"static_images#create", as: "static_images"

  patch "/static_image/", to:"static_images#update"#, as: "static_images"

  get "/static_image/edit/:id", to:"static_images#edit", as: "static_images_edit"

  get "/static_image/show/:id", to:"static_images#show", as: "static_images_show"


  get '/static_text', to:'static_texts#show'
  get '/static_text/edit/:id', to:'static_texts#edit', as: 'edit_static_text'
  get '/static_text/new', to:'static_texts#edit', as: 'new_static_text'

end
