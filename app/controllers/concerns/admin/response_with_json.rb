module Admin::ResponseWithJson
  include ResponseWithJson

  private

  def render_data(data, status)
    class_name = %w[ActiveRecord::Relation ActiveRecord::AssociationRelation].include?(data.class.name) ? data.sti_name : data.class.name

    if MODEL_SERIALIZER.include?(class_name)
      options = build_options(data)
      render json: "Admin::#{class_name}Serializer".constantize.new(data, options).serialized_json
    else
      render json: data, status: status
    end
  end
end
