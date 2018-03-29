require 'active_support/concern'

module NameBehavior
  extend ActiveSupport::Concern

  included do
    after_validation :update_name_unicode, if: -> { name_changed? || name_unicode.blank? }
  end

  module InstanceMethods
    private

    def update_name_unicode
      self.name_unicode = name.no_unicode
    end
  end

  def self.included(receiver)
    receiver.send :include, InstanceMethods
  end
end
