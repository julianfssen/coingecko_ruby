module CoingeckoRuby
  class Client
    module Exchanges
      def get_exchanges
        get('exchanges')
      end

      def get_exchange_data(id:)
        get("exchanges/#{id}")
      end

      def get_exchange_ids
        get('exchanges/list')
      end

      def get_exchange_tickers(id:, coin_ids:)
        get("exchanges/#{id}/tickers", { query: { coin_ids: coin_ids } })
      end

      def get_exchange_status_updates(id:)
        get("exchanges/#{id}/status_updates")
      end

      def get_exchange_volume(id:, days:)
        get("exchanges/#{id}/volume_chart", { query: { days: days } })
      end

      def get_markets(ids:, currency: 'usd')
        get('coins/markets', { query: { ids: ids, vs_currency: currency } })
      end
    end
  end
end
