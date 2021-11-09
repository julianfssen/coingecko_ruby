module CoingeckoRuby
  class Resource
    def initialize(raw_response)
      @raw_response = raw_response
    end

    def method_missing(attr, *args)
      @raw_response.dig(attr.to_s) || super
    end

    def respond_to_missing?(attr, *args, &block)
      @raw_response.has_key?(attr.to_s) || super
    end
  end
end
