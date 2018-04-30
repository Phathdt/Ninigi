module NormalUser
  class AlbumImageService < BaseService
    def index(restaurant, page_number)
      album_images = restaurant.album_images.page(page_number || 1)
      [album_images, :ok]
    end
  end
end
