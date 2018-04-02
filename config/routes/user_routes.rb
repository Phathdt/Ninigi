module UserRoutes
  def self.extended(router)
    router.instance_exec do
      namespace :api, defaults: { format: :json } do
        namespace :v1 do
          resources :restaurants do
            resources :album_images, shallow: true, only: %i[index show destroy]
            member do
              get :repending
              get :published
            end
          end
        end
      end
    end
  end
end
