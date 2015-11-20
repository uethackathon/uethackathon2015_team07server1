Rails.application.routes.draw do
  root 'static_pages#index'

  namespace :api, defaults: {format: :json} do
    resources :histories, only: :index
  end
end
