module UserRoutes
  def self.extended(router)
    router.instance_exec do
      namespace :api, defaults: { format: :json } do
        namespace :v2 do
          scope module: 'user' do
            resources :restaurants do
              member do
                get :repending
                get :published
              end

              resources :album_images, shallow: true, only: %i[index show destroy]

              resources :manager_requests, shallow: true, only: %i[index show create] do
                member do
                  get :approve
                  get :repending
                  post :reject
                  post :retire
                end
              end

              resources :dishes, shallow: true, only: %i[index show create update destroy] do
                member do
                  get :toggle_active
                  get :toggle_public
                end
                resources :variants, shallow: true, only: %i[create update destroy]
                resources :reviews, shallow: true, only: %i[index create destroy]
              end

              resources :reviews, shallow: true, only: %i[index create]
            end
          end
        end
      end
    end
  end
end
