module Admin::ResponseWithJson
  include ResponseWithJson

  private

  def render_action(data, class_name,options)
    if action_name == 'index'
      render json: "Admin::#{class_name}Serializer".constantize.new(data, options).serialized_json
    else
      render json: "Admin::Detail#{class_name}Serializer".constantize.new(data, options).serialized_json
    end
  end
end
