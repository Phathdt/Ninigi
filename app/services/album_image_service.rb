class AlbumImageService < BaseService
  def index(restaurant, page_number)
    album_images = restaurant.album_images.page(page_number || 1)
    [album_images, :ok]
  end

  private

  def render_state_error
    [{ message: I18n.t('restaurants.state.error') }, :unprocessable_entity]
  end
end
