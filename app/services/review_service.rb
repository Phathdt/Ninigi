class ReviewService < BaseService
  def index(reviewable, page_number)
    reviews = reviewable.reviews.includes(:images, :user).page(page_number || 1)
    [reviews, :ok]
  end

  def create(reviewable, params)
    review = reviewable.reviews.new(params)
    review.user = current_user
    message = simple_create(review, options)
    render_message(message)
  end

  def destroy(review)
    custom_destroy review
  end

  def repending(restaurant)
    return render_state_error unless restaurant.may_repending?
    restaurant.repending!
    [{ notice: I18n.t('restaurants.state.approve') }, :ok]
  end

  def published(restaurant)
    return render_state_error unless restaurant.may_published?
    restaurant.published!
    [{ notice: I18n.t('restaurants.state.published') }, :ok]
  end

  private

  def render_state_error
    [{ message: I18n.t('restaurants.state.error') }, :unprocessable_entity]
  end
end
