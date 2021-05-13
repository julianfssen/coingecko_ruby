module CoingeckoRuby
  class Client
    module Prices
      def get_prices(ids:, vs_currencies: 'usd')
        get('simple/price', { query: { ids: ids, vs_currencies: vs_currencies } })
      end

      def get_historical_price_on_date(id:, date:)
        get("coins/#{id}/history", { query: { date: date } })
      end

      def get_minutely_historical_prices(id:, vs_currency: 'usd')
        get("coins/#{id}/market_chart", { query: { vs_currency: vs_currency, days: 1 } })
      end

      def get_hourly_historical_prices(id:, days:)
        return get_daily_historical_prices(id: id, days: days) if days > 90

        get("coins/#{id}/market_chart", { query: { vs_currency: vs_currency, days: days } })
      end

      def get_daily_historical_prices(id:, days:)
        get("coins/#{id}/market_chart", { query: { vs_currency: vs_currency, days: days, interval: 'daily' } })
      end
    end
  end
end
