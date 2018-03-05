module FlashBuilder
  extend ActiveSupport::Concern

  protected

  def build_flash(status, options = {})
    status ? { notice: success_msg(options) } : { alert: failure_msg(options), errors: errors(options) }
  end

  def success_msg(options = {})
    flash_of_status('success', options)
  end

  def failure_msg(options = {})
    if options[:obj].is_a?(ApplicationRecord)
      Rails.logger.error "[][][] Failed validation: #{options[:obj].errors.full_messages}"
    end
    flash_of_status('failure', options)
  end

  def errors(options = {})
    options[:obj].errors.full_messages.first
  end

  def flash_of_status(status, options = {})
    controller = options.fetch(:controller)
    action     = options.fetch(:action)

    I18n.t("#{controller.gsub(/.+\//, '')}.#{action}.#{status}")
  end
end
