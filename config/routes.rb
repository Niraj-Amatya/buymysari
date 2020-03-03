Rails.application.routes.draw do
  get 'payments/success'
  devise_for :users
  get "/", to: "pages#home", as: "root"
  resources :listings do
    resources :comments
  end

  devise_scope :user do
    get '/sign-in' => "devise/sessions#new", :as => :login
  end
  
  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"


  get "/:path", to: "pages#not_found"

end
