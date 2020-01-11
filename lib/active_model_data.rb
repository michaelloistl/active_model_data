require 'active_model_data/version'

#
module ActiveModelData
  # extend ActiveSupport::Concern

  class Error < StandardError; end

  #
  module ClassMethods
    def model_data_field(key, **args)
      puts "==> data_field... key: #{key} args: #{args.inspect} class: #{inspect}"
    end
  end
end
