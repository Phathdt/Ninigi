Rails.application.routes.draw do
  devise_for :users, only: []
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      scope :users do
        post   :sign_up,      to: 'registrations#create'
        post   :sign_in,      to: 'sessions#create'
        delete :sign_out,     to: 'sessions#destroy'
        post   :password,     to: 'passwords#create'
        get    :password,     to: 'passwords#edit'
        patch  :password,     to: 'passwords#update'
        put    :password,     to: 'passwords#change'
        get    :confirmation, to: 'confirmations#show'
        post   :confirmation, to: 'confirmations#create'
      end
    end
    match '*path', to: 'base_api#routing_error', via: :all
  end
end
