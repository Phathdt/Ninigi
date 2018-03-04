module FlashBuilder
  extend ActiveSupport::Concern

  protected

  def build_flash(status, options = {})
    status ? { notice: success_msg(options) } : { alert: failure_msg(options) }
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

  def flash_of_status(status, options = {})
    controller = options.fetch(:controller, params[:controller])
    action     = options.fetch(:action, params[:action])

    I18n.t("#{controller.gsub(/.+\//, '')}.#{action}.#{status}")
  end
end
