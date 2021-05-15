module CoingeckoRuby
  class Client
    module Coins
      # Fetches the id, name, and symbol of every coin supported by CoinGecko's API.
      #
      # @return [Array<Hash>] returns an array of hashes for every supported coin's id, name, and symbol
      #
      # @example Fetch the list of coins supported by CoinGecko's API.
      #   client.coins_list
      def coins_list
        get('coins/list')
      end

      # Fetches detailed current data for a coin.
      # @param id [String] the coin id to fetch.
      #
      # @return [Hash] returns comprehensive current data for the given coin.
      #
      # @example Fetch Bitcoin's current data.
      #   client.get_coin_data(id: 'bitcoin')
      def get_coin_data(id:)
        get("coins/#{id}")
      end

      # Fetches the list of tickers (e.g: BTC-USD) for a coin
      # @param id [String] the coin id to fetch.
      #
      # @return [Hash] returns the list of tickers for the given coin.
      #
      # @example Fetch Bitcoin's tickers.
      #   client.get_tickers(id: 'bitcoin')
      def get_tickers(id:)
        get("coins/#{id}/tickers")
      end

      # Fetches market data for a coin or a list of coins.
      # @param ids [String] the coin id or ids to fetch.
      # @param currency [String] the currency to display market price data.
      #
      # @return [Array<Hash>] returns market data for the given coin or coins.
      #
      # @example Fetch market data for every CoinGecko-supported coin in USD.
      #   client.get_markets(ids: 'bitcoin', currency: 'usd')
      # @example Fetch market data for Bitcoin and Ethereum in GBP.
      #   client.get_markets(ids: 'bitcoin, ethereum', currency: 'gbp')
      def get_markets(ids:, currency: 'usd')
        get('coins/markets', { query: { ids: ids, vs_currency: currency } })
      end
    end
  end
end
