module SimpleDestroy
  extend ActiveSupport::Concern

  included do
    include FlashBuilder
  end

  protected

  def custom_destroy(record)
    if record.destroy
      render json: { message: I18n.t('swal.delete_success') }, status: :ok
    else
      render json: record.errors[:base].to_sentence, status: :internal_server_error
    end
  end
end
