module Api::V2
  class NormalUser::AlbumImagesController < NormalUser::NormalUserController
    before_action :find_restaurant, only: %i[index]
    before_action :find_album_image, only: %i[show destroy]

    def index
      return render_missing_restaurant unless can_action?(current_user, @restaurant)
      data, status = service.index(@restaurant, params[:page])
      render_json(data, status)
    end

    def show
      return render_missing_restaurant unless can_action?(current_user, @album_image.restaurant)
      render_json(@album_image, :ok)
    end

    private

    def find_restaurant
      @restaurant ||= Restaurant.find(params[:restaurant_id])
    end

    def find_album_image
      @album_image ||= AlbumImage.find(params[:id])
    end

    def can_action?(user, restaurant)
      AlbumImagePolicy::Scope.new(user || User.new, restaurant).can_action?
    end
  end
end
