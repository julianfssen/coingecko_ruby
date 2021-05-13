module CoingeckoRuby
  class Client
    module Status
      def status
        get('ping')
      end
    end
  end
end
