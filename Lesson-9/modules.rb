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
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    attr_reader :validates

    def validate(attr_name, validation_type, option = nil)
      @validates ||= []
      @validates << [attr_name, validation_type, option]
    end
  end

  module InstanceMethods
    def validate!
      self.class.validations.each do |validation|
        validate_type = validation[0]
        name = validation[1]
        var = instance_variable_get("@#{name}")
        option = validation[2]

        send("#{validate_type}_validation", var, name, option)
    end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  private

  def presence_validation(name, var, option)
  end

  def type_validation(name, var, option)
  end

  def format_validation(name, var, option)
  end
  
end
