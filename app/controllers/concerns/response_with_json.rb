module ResponseWithJson
  extend ActiveSupport::Concern

  private

  def render_json(data, status)
    if data.try(:errors).present?
      render_error(data[:errors], status)
    else
      render_data(data, status)
    end
  end

  def render_data(data, status)
    class_name = %w[ActiveRecord::Relation ActiveRecord::AssociationRelation].include?(data.class.name) ? data.sti_name : data.class.name

    if MODEL_SERIALIZER.include?(class_name)
      options = {}
      options[:scope] = {
        current_user: current_user || User.new,
        size: params[:size]&.to_sym
      }
      render json: "#{class_name}Serializer".constantize.new(data, options).serialized_json
    else
      render json: data, status: status
    end
  end
end
