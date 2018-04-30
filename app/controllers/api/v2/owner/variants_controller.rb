module Api::V2
  class Owner::VariantsController < Owner::OwnerController
    before_action :find_dish, only: %i[create]
    before_action :find_variant, only: %i[update destroy]
    before_action :authorize_variant, only: %i[update destroy]

    def create
      authorize @dish.variants.new
      data, status = service.create(@dish, variant_params)
      render_json(data, status)
    end

    def update
      data, status = service.update(@variant, variant_params)
      render_json(data, status)
    end

    def destroy
      data, status = service.destroy(@variant)
      render_json(data, status)
    end

    private

    def find_dish
      @dish ||= Dish.find(params[:dish_id])
    end

    def find_variant
      @variant ||= Variant.find(params[:id])
    end

    def variant_params
      params.require(:variants).permit(:size, :price)
    end

    def authorize_variant
      authorize @variant
    end
  end
end
