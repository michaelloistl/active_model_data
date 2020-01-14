require 'active_model'
require 'active_record'
require 'active_support'
require 'active_model_data/version'

#
module ActiveModelData
  extend ActiveSupport::Concern

  class Error < StandardError; end

  #
  module ClassMethods

    def model_data_field(key, **args)
      column = args[:column] || 'model_data'

      serialize column.to_sym, Hash

      define_method "#{key}_value" do
        hash = try(column)

        # default
        if args[:default] && hash
          hash[key] = args[:default] if hash[key].nil?
          assign_attributes(column.to_sym => hash)
        end

        hash[key] if hash
      end

      define_method "#{key}_value=" do |value|
        hash = try(column)
        hash[key] = value if hash
        assign_attributes(column.to_sym => hash)
      end
    end
  end
end
