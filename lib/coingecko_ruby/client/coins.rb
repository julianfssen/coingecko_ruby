module CoingeckoRuby
  class Client
    module Coins
      def coins_list
        get('coins/list')
      end

      def get_coin_data(id:)
        get("coins/#{id}")
      end

      def get_coin_tickers(id:)
        get("coins/#{id}/tickers")
      end

      def get_markets(ids:, currency: 'usd')
        get('coins/markets', { query: { ids: ids, vs_currency: currency } })
      end
    end
  end
end
