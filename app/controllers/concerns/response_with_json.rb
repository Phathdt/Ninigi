module ResponseWithJson
  extend ActiveSupport::Concern

  private

  def render_json(data, status)
    if data[:errors]
      render_error(data[:errors], status)
    else
      render json: data, status: status
    end
  end
end
