module CoingeckoRuby
  class Client
    module Status
      # Fetches CoinGecko's API status.
      #
      # @return [Hash] returns CoinGecko's API status.
      #
      # @example Fetch CoinGecko's API status.
      #   client.status
      def status
        get 'ping'
      end
    end
  end
end
