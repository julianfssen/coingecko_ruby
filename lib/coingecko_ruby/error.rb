require 'faraday'

module CoingeckoRuby
  class FaradayError < Faraday::Error
    def self.wrap_error(error)
      class_to_wrap = error.class.name.split('::').last
      wrapped_error_class = Class.new(error.class)
      if CoingeckoRuby.const_defined?(class_to_wrap)
        CoingeckoRuby.const_get(class_to_wrap)
      else
        CoingeckoRuby.const_set(class_to_wrap, wrapped_error_class)
      end
    end
  end

  class Error < StandardError; end
end
