Rails.application.routes.draw do
  # devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :auth do
        post :sign_up, to: 'registrations#create'
        post :sign_in, to: 'sessions#create'
        delete :sign_out, to: 'sessions#destroy'
        post :password, to: 'passwords#create'
      end
    end
  end
end
