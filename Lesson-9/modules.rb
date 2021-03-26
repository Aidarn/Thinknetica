# frozen_string_literal: true

module Company
  attr_accessor :company_name
end

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    attr_writer :instances

    def instances
      @instances ||= 0
    end
  end

  module InstanceMethods
    private

    def register_instance
      self.class.instances += 1
    end
  end
end

module Validation
  def valid?
    validate!
    true
  rescue StandardError
    false
  end
end
