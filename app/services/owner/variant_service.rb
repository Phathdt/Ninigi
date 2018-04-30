module Owner
  class VariantService < BaseService
    def create(dish, variant_params)
      variant = dish.variants.new(variant_params)
      message = simple_create(variant, options)
      render_message(message)
    end

    def update(variant, variant_params)
      message = simple_update(variant, variant_params, options)
      render_message(message)
    end

    def destroy(variant)
      message = custom_destroy variant
      message
    end
  end
end
