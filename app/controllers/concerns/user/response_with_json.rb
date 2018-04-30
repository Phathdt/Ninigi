module User::ResponseWithJson
  include ResponseWithJson

  private

  def render_action(data, class_name, options)
    if action_name == 'index'
      render json: "User::#{class_name}Serializer".constantize.new(data, options).serialized_json
    else
      render json: "User::Detail#{class_name}Serializer".constantize.new(data, options).serialized_json
    end
  end
end
