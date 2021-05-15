module CoingeckoRuby
  class Client
    module Prices
      def get_prices(ids:, vs_currencies: 'usd')
        get('simple/price', { query: { ids: ids, vs_currencies: vs_currencies } })
      end

      def get_historical_price_on_date(id:, date:)
        get("coins/#{id}/history", { query: { date: date } })
      end

      def get_minutely_historical_prices(id:, currency: 'usd')
        get("coins/#{id}/market_chart", { query: { vs_currency: currency, days: 1 } })
      end

      def get_hourly_historical_prices(id:, days:, currency: 'usd')
        return get_daily_historical_prices(id: id, days: days) if days > 90

        get("coins/#{id}/market_chart", { query: { vs_currency: currency, days: days } })
      end

      def get_daily_historical_prices(id:, days:, currency: 'usd')
        get("coins/#{id}/market_chart", { query: { vs_currency: currency, days: days, interval: 'daily' } })
      end

      def get_ohlc(id:, days:, currency: 'usd')
        get("coins/#{id}/ohlc", { query: { vs_currency: currency, days: days } })
      end

      def supported_currencies
        get('simple/supported_vs_currencies')
      end

      def get_exchange_rate(from:, to: 'usd')
        get_prices(ids: from, vs_currencies: to)
      end
    end
  end
end
