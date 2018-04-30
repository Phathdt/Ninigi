module AuthenticationRoutes
  def self.extended(router)
    router.instance_exec do
      namespace :api, defaults: { format: :json } do
        namespace :v2 do
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
      end
    end
  end
end
