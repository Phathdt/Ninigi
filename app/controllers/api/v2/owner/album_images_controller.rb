module Api::V2
  class Owner::AlbumImagesController < Owner::OwnerController
    before_action :find_restaurant, only: %i[index]
    before_action :find_album_image, only: %i[show destroy]

    def index
      data, status = service.index(@restaurant, params[:page])
      render_json(data, status)
    end

    def show
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
  end
end
