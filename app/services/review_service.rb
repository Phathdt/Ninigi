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
end
