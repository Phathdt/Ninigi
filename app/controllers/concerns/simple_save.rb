module SimpleSave
  extend ActiveSupport::Concern

  included do
    include FlashBuilder
  end

  protected

  def simple_create(obj, options = {})
    build_flash obj.save, options.merge(obj: obj)
  rescue(options[:exception] || RuntimeError)
    build_flash false, options
  end

  def simple_update(obj, obj_params, options = {})
    build_flash obj.update(obj_params), options.merge(obj: obj)
  rescue(options[:exception] || RuntimeError)
    build_flash false, options
  end

  alias_method :simple_save, :simple_create
end
