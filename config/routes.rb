Rails
  .application
  .routes
  .draw do
    devise_for :users

    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
    # Can be used by load balancers and uptime monitors to verify that the app is live.
    get 'up' => 'rails/health#show', :as => :rails_health_check

    # Defines the root path route ("/")
    # root "posts#index"
    resources :tiny_urls, only: %i[index create], param: :new_url

    get ':new_url', to: 'tiny_urls#show', param: :new_url, as: :show

    root to: 'tiny_urls#index'
  end
