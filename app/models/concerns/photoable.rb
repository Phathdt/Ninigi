require 'active_support/concern'

module Photoable
  extend ActiveSupport::Concern

  included do
    after_create { ProcessImagesJob.perform_later(self) }

    validates :temp_url, presence: true, unless: Proc.new { |photoable| photoable.photo.exists? }
  end

  module InstanceMethods
    def url(version = :original)
      temp_url || photo.url(version)
    end
  end

  def self.included(receiver)
    receiver.send :include, InstanceMethods
  end
end
