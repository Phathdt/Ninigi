class BaseService
  include SimpleSave
  include SimpleDestroy

  attr_accessor :options

  def initialize(current_user = nil, controller = nil, action = nil)
    @current_user = current_user
    @options = { controller: controller, action: action }
  end

  def current_user
    @current_user
  end
end
