module Api::V1
  class AlbumImagesController < BaseApiController
    # prepend_before_action :authenticate_request!, only: %i[create update destroy repending published]
    before_action :find_restaurant, only: %i[index]
    before_action :find_album_image, only: %i[show]

    def index
      data, status = service.index(@restaurant, params[:page])
      render_json(data, status)
    end

    def show
      render_json(@album_image, :ok)
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
  end
end
