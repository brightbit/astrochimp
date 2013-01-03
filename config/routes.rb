Astrochimp::Engine.routes.draw do
  root to: "signups#index"

  resources :signups, only: [:index, :create, :show]
  get 'r/:referrer_code' => 'signups#index', as: :referral_link
end
