class BaseService
  include SimpleSave
  include SimpleDestroy

  attr_accessor :options
  attr_reader :current_user

  def initialize(current_user = nil, controller = nil, action = nil)
    @current_user = current_user
    @options = { controller: controller, action: action }
  end
end
