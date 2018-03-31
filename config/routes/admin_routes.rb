module AdminRoutes
  def self.extended(router)
    router.instance_exec do
      namespace :api, defaults: { format: :json } do
        namespace :v1 do
          namespace :admin do
            resources :restaurants, only: %i[index show] do
              member do
                post :approve
                post :reject
              end
            end
          end
        end
      end
    end
  end
end
