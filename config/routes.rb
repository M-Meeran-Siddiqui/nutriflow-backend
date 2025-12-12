Rails.application.routes.draw do
  # Devise setup (JSON only, no default controllers)
  devise_for :users,
             defaults: { format: :json },
             skip: [ :sessions, :registrations, :passwords ]

  # Custom Auth Routes
  scope :auth do
    post   "register", to: "auth#register"
    post   "login",    to: "auth#login"
    get    "me",       to: "auth#me"
    delete "logout",   to: "auth#logout"
  end

  # Health check (optional)
  get "up" => "rails/health#show", as: :rails_health_check
end
