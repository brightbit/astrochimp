Astrochimp::Engine.routes.draw do
  root to: "signups#index"

  resource :signups, only: [:index, :create]
end
