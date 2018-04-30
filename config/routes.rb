Rails.application.routes.draw do
  extend AuthenticationRoutes
  extend AdminRoutes
  extend UserRoutes
  extend OwnerRoutes

  devise_for :users, only: []
  namespace :api, defaults: { format: :json } do
    match '*path', to: 'base_api#routing_error', via: :all
  end
end
