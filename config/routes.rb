Rails.application.routes.draw do
  # devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :auth do
        post :sign_up, to: 'registrations#create'
      end
    end
  end
end
