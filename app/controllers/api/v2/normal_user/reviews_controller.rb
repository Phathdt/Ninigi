module Api::V2
  class NormalUser::ReviewsController < NormalUser::NormalUserController
    prepend_before_action :authenticate_request!, only: %i[create]
    before_action :find_reviewable, only: %i[index create]

    def index
      data, status = service.index(@reviewable, params[:page])
      render_json(data, status)
    end

    def create
      data, status = service.create(@reviewable, review_params)
      render_json(data, status)
    end

    private

    def find_reviewable
      reviewable_type = params[:reviewable_type]
      @reviewable ||= reviewable_type.constantize.find(params[:reviewable_id])
    end

    def review_params
      params.require(:reviews).permit(:content, :point, images_attr)
    end

    def images_attr
      { images_attributes: %i[id caption is_cover temp_url _destroy] }
    end
  end
end
