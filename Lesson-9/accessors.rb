# frozen_string_literal: true

module Accessors
  def attr_accessor_with_history(*attributes)
    attributes.each do |name|
      var_name = "@#{name}".to_sym
      attr_hist_name = "@#{name}_history".to_sym

      define_method(name) { instance_variable_get(var_name) }

      define_method("#{name}=".to_sym) do |value|
        if instance_variable_get(attr_hist_name).nil?
          instance_variable_set(attr_hist_name, [])
        else
          instance_variable_get(attr_hist_name) << instance_variable_get(var_name)
        end
        instance_variable_set(var_name, value)
      end

      define_method("#{name}_history") { instance_variable_get(var_name_history) }
    end

    def strong_attr_accessor(name, class_name)
      var_name = "@#{name}".to_sym

      define_method(name) { instance_variable_get(var_name) }

      define_method("#{name}=") do |value|
        raise TypeError, 'Неверный класс' unless value.is_a?(class_name)

        instance_variable_set(var_name, value)
      end
    end
  end
end
