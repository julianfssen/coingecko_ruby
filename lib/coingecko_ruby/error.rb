require 'faraday'

module CoingeckoRuby
  class Error < StandardError
    def initialize(message)
      super message
    end

    class << self
      def wrap_error(error)
        error_class = error.class
        class_to_wrap = error_class.name.split('::').last
        wrapped_error_class = Class.new(error_class)
        CoingeckoRuby.const_set(class_to_wrap, wrapped_error_class)
      end
    end
  end
end
