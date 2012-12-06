Astrochimp::Engine.routes.draw do
  root to: "signups#index"

  resources :signups, only: [:index, :create, :show]
end
