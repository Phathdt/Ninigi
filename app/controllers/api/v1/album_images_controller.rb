module Api::V1
  class AlbumImagesController < BaseApiController
    prepend_before_action :authenticate_request!, only: %i[destroy]
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

    def destroy
      authorize @album_image
      data, status = service.destroy(@album_image)
      render_json(data, status)
    end

    private

    def find_restaurant
      @restaurant ||= Restaurant.find(params[:restaurant_id])
    end

    def find_album_image
      @album_image ||= AlbumImage.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurants).permit(:name, :address, :phone, :desc,
        album_images_attrs)
    end

    def album_images_attrs
      { album_images_attributes: %i[id caption is_cover temp_url _destroy] }
    end

    def can_action?(user, restaurant)
      AlbumImagePolicy::Scope.new(user || User.new, restaurant).can_action?
    end
  end
end
