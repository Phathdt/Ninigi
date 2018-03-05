module ResponseWithJson
  extend ActiveSupport::Concern

  private

  def render_json(data, status)
    render json: data, status: status
  end
end
