Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :tiny_urls, only: [:index, :create], param: :mini_url

  get ':mini_url', to: 'tiny_urls#show', param: :mini_url, as: :show
  get ':mini_url/info', to: 'tiny_urls#info', param: :mini_url, as: :info

  root to: 'tiny_urls#index'
end
