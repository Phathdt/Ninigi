module SimpleDestroy
  extend ActiveSupport::Concern

  protected

  def custom_destroy(record)
    if record.destroy
      [{ message: I18n.t("#{record.model_name.plural}.destroy.success") }, :ok]
    else
      [{ errors: record.errors[:base].to_sentence }, :internal_server_error]
    end
  end
end
