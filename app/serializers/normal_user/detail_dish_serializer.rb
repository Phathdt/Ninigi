class NormalUser::DetailDishSerializer < BaseSerializer
  include ::CommonAttributes::Dish

  attribute :variants do |object|
    object.variants.map do |variant|
      {
        id: variant.id,
        size: I18n.t("size.#{variant.size}"),
        price: variant.price
      }
    end
  end
end
