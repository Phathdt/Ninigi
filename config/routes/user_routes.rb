module UserRoutes
  def self.extended(router)
    router.instance_exec do
      namespace :api, defaults: { format: :json } do
        namespace :v2 do
          scope module: 'normal_user', path: 'user' do
            resources :restaurants, only: %i[index show] do
              resources :album_images, shallow: true, only: %i[index show]

              resources :dishes, shallow: true, only: %i[index show] do
              end
            end

            resources :manager_requests, shallow: true, only: %i[index show] do
              member do
                get :approve
                post :reject
                post :retire
              end
            end

            resources :reviews, only: %i[index create]
          end
        end
      end
    end
  end
end
