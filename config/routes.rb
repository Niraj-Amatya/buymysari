Rails.application.routes.draw do
  get 'payments/success'
  devise_for :users
  get "/", to: "pages#home", as: "root"

  # comments nested under the lsiting, so each comment is chained
  # with their specific lisitng
  resources :listings do
    resources :comments
  end
  # user routes for profile
  resources :users

  # routes for messaging:message nested under the conversation
  resources :conversations do
    resources :messages
  end

  # stripe routes
  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"

# routes where page is not found
  get "/:path", to: "pages#not_found"

end
