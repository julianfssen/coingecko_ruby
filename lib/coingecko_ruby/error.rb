require 'faraday'

module CoingeckoRuby
  class Error < StandardError
    class << self
      def delegate_and_return_error(error)
        error_class_name = error.class.name.split('::').last
        if CoingeckoRuby.const_defined?(error_class_name)
          error_class = CoingeckoRuby.const_get(error_class_name)
          error_class.new(error)
        else
          delegated_error_class = DelegateClass(error.class) do
            def initialize(error)
              super error
            end
          end
          CoingeckoRuby.const_set(error_class_name, delegated_error_class)
          delegated_error_class.new(error)
        end
      end
    end
  end
end
