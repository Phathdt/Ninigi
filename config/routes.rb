Rails.application.routes.draw do
  # extend AuthenticationRoutes
  # extend AdminRoutes
  # extend OwnerRoutes
  extend UserRoutes

  devise_for :users, only: []
  namespace :api, defaults: { format: :json } do
    match '*path', to: 'base_api#routing_error', via: :all
  end
end
