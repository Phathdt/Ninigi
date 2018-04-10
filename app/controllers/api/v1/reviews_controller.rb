module Api::V1
  class ReviewsController < BaseApiController
    prepend_before_action :authenticate_request!, only: %i[create destroy]
    before_action :find_reviewable, only: %i[index create]
    before_action :find_review, only: %i[destroy]

    def index
      data, status = service.index(@reviewable, params[:page])
      render_json(data, status)
    end

    def create
      data, status = service.create(@reviewable, review_params)
      render_json(data, status)
    end

    def destroy
      authorize @review
      data, status = service.destroy(@review)
      render_json(data, status)
    end

    private

    def find_reviewable
      @reviewable ||=
        if params[:restaurant_id].present?
          Restaurant.find(params[:restaurant_id])
        else
          Dish.find(params[:dish_id])
        end
    end

    def find_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:reviews).permit(:content, :point, images_attr)
    end

    def images_attr
      { images_attributes: %i[id caption is_cover temp_url _destroy] }
    end
  end
end
