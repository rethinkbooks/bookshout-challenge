Rails.application.routes.draw do
  mount_opro_oauth
  devise_for :users
  root to: "home#index"
  namespace :api, defaults: {format: 'json'} do
    scope module: :v1 do
      resources :tasks
    end
  end
end
