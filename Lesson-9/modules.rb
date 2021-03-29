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
      @validates << [validation_type, attr_name, option]
    end
  end

  module InstanceMethods
    def validate!
      self.class.validates.each do |validation|
        validate_type = validation[0]
        name = validation[1]
        var = instance_variable_get("@#{name}")
        option = validation[2]

        send("#{validate_type}_validation", var, name, option)
      end
    end
  end

  def valid?
    validate!
    true
  rescue ValidationError
    false
  end

  private

  def presence_validation(var, _name, _option)
    raise ValidationError, 'Значение атрибута не может быть nil' if var.nil?
    raise ValidationError, 'Значение атрибута на может быть пустой строкой' if var.to_s.empty?
  end

  def type_validation(var, _name, option)
    raise ValidationError, 'Неверный класс' unless var.is_a?(option)
  end

  def format_validation(var, _name, option)
    raise ValidationError, 'Неверный тип' if var.is_a?(option)
  end
end

class ValidationError < StandardError; end
