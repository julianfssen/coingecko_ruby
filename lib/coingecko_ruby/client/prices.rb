module CoingeckoRuby
  class Client
    module Prices
      # Fetches the current price for a coin in the given coin or currency.
      # @param id [String] the coin id to fetch.
      # @param currency [String] the currency to display the coin's price.
      # @option options [Boolean] :include_market_cap include market cap data.
      # @option options [Boolean] :include_24hr_vol include 24 hour volume data.
      # @option options [Boolean] :include_24hr_change include 24 hour price change data.
      # @option options [Boolean] :include_last_updated_at include last updated at value for the given coin.
      #
      # @return [Hash] returns the given coin id and its current price.
      #
      # @example Fetch the current price in USD for Bitcoin.
      #   client.get_price(id: 'bitcoin', currency: 'usd')
      # @example Sample response object
      #   {
      #     "bitcoin" => {
      #       "usd" => 47931 # current price in given currency
      #     }
      #   }
      # @example Fetch the current price, market cap, 24 hour volume, 24 hour price change and last updated at for Bitcoin.
      #   client.get_price(id: 'bitcoin', currency: 'usd', options: { include_market_cap: true, include_24hr_vol: true, include_24hr_change: true, include_last_updated_at: true })
      # @example Sample response object
      #   {
      #     "bitcoin" => {
      #       "usd" => 48217, # current price in given currency
      #       "usd_market_cap" => 905542853013.7438, # market cap in given currency
      #       "usd_24h_vol" => 66724791943.1098, # 24 hour volume in given currency
      #       "usd_24h_change" => -2.813036070702345, # 24 hour price change percentage
      #       "last_updated_at" => 1621142197 # last updated at UNIX timestamp for the given coin
      #     }
      #   }
      def get_price(id:, currency: 'usd', options: {})
        get 'simple/price', { ids: id, vs_currencies: currency, options: options }
      end

      # Fetches historical price data for a coin at a given date.
      # @param id [String] the coin id to fetch.
      # @param date [String] the date to fetch the historical price, date given must be in the form of 'DD-MM-YYYY' (e.g: '14-05-2021').
      #
      # @return [Hash] returns the coin's historical price data on the given date.
      #
      # @example Fetch Bitcoin's price on 30th December, 2017.
      #   client.get_historical_price_on_date(id: 'bitcoin', date: '30-12-2017')
      # @example Sample response object (truncated)
      #   {
      #     "id": "bitcoin",
      #     "symbol": "btc",
      #     "name": "Bitcoin",
      #     "localization": {
      #       "en": "Bitcoin",
      #       "ja": "ビットコイン",
      #       "id": "Bitcoin"
      #     },
      #     "image": {
      #       "thumb": "https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579",
      #       "small": "https://assets.coingecko.com/coins/images/1/small/bitcoin.png?1547033579"
      #     },
      #     "market_data": {
      #       "current_price": {
      #         "btc": 1,
      #         "eth": 18.483094024188404,
      #         "eur": 11345.8976447824,
      #         "gbp": 10079.0677868681,
      #         "usd": 13620.3618741461,
      #       },
      #       "market_cap": {
      #         "btc": 16772375,
      #         "eth": 310005384.13394696,
      #         "eur": 190297650009.907,
      #         "gbp": 169049904571.772,
      #         "usd": 228445816988.881,
      #       },
      #       "total_volume": {
      #         "btc": 264345.493482963,
      #         "eth": 4885922.610916088,
      #         "eur": 2999236911.91719,
      #         "gbp": 2664356147.96788,
      #         "usd": 3600481281.03768,
      #       }
      #     },
      #     "community_data": {
      #       "facebook_likes": null,
      #       "twitter_followers": 603664,
      #       "reddit_average_posts_48h": 2.042,
      #       "reddit_average_comments_48h": 445.896,
      #       "reddit_subscribers": 612412,
      #       "reddit_accounts_active_48h": "14074.0"
      #     },
      #     "developer_data": {
      #       "forks": 13660,
      #       "stars": 23665,
      #       "subscribers": 2513,
      #       "total_issues": 3591,
      #       "closed_issues": 3022,
      #       "pull_requests_merged": 5038,
      #       "pull_request_contributors": 450,
      #       "code_additions_deletions_4_weeks": {
      #         "additions": null,
      #         "deletions": null
      #       },
      #       "commit_count_4_weeks": 147
      #     },
      #     "public_interest_stats": {
      #       "alexa_rank": 2912,
      #       "bing_matches": null
      #     }
      #   }
      def get_historical_price_on_date(id:, date:)
        get "coins/#{id}/history", { date: date }
      end

      # Fetches a coin's historical price data in 5 - 10 minutes ranges.
      # @note Minutely historical data is only available within the last 24 hours.
      # @param id [String] the coin id to fetch.
      # @param currency [String] the currency used to display minutely historical price.
      #
      # @return [Hash] returns the coin's minutely historical price data within the last 24 hours.
      #
      # @example Fetch Bitcoin's minutely historical price within the last 24 hours.
      #   client.get_minutely_historical_prices(id: 'bitcoin')
      # @example Sample response object (truncated)
      #   {
      #     "prices" => [
      #       [1621057474114, 49364.605172521166], # [UNIX timestamp for minutely price data, coin price in given currency]
      #       [1621057731319, 49482.24672699064],
      #       [1621058047104, 49759.16253913667],
      #     ],
      #     "market_caps" => [
      #       [1621057474114, 923529491095.7441],
      #       [1621057731319, 923529491095.7441],
      #       [1621058047104, 925839705121.9677],
      #     ],
      #     "total_volumes" => [
      #       [1621057474114, 55351845301.87241],
      #       [1621057731319, 55565821585.076706],
      #       [1621058047104, 57046967935.326035],
      #     ]
      #   }
      def get_minutely_historical_prices(id:, currency: 'usd')
        get "coins/#{id}/market_chart", { id: id, vs_currency: currency, days: 1 }
      end

      # Fetches a coin's historical price data in 1 hour ranges.
      # @note Hourly historical data is only available within the last 90 days.
      # @param id [String] the coin id to fetch.
      # @param days [Integer] the number of days to fetch hourly historical prices (min: 1 day, max: 90 days)
      # @param currency [String] the currency used to display hourly historical price.
      #
      # @return [Hash] returns the coin's hourly historical price data within the number of days given.
      #
      # @example Fetch Bitcoin's hourly historical price within the last 7 days.
      #   client.get_hourly_historical_prices(id: 'bitcoin', days: 7)
      # @example Sample response object (truncated)
      #   {
      #     "prices" => [
      #       [1620540153122, 58533.64354969528], # [UNIX timestamp for minutely price data, coin price in given currency]
      #       [1620543723872, 58384.26782776662],
      #       [1620547381049, 58022.030773147424],
      #     ], "market_caps" => [
      #       [1620540153122, 1094831531450.288],
      #       [1620543723872, 1092040480555.5005],
      #       [1620547381049, 1085268316789.8125],
      #     ], "total_volumes" => [
      #       [1620540153122, 71975097904.11748],
      #       [1620543723872, 72192190625.33702],
      #       [1620547381049, 72064327648.28767],
      #     ]
      #   }
      def get_hourly_historical_prices(id:, days:, currency: 'usd')
        return get_daily_historical_prices(id: id, days: days) if days > 90

        get "coins/#{id}/market_chart", { vs_currency: currency, days: days }
      end

      # Fetches a coin's historical price data in daily ranges.
      # @param id [String] the coin id to fetch.
      # @param days [Integer] the number of days to fetch daily historical prices.
      # @param currency [String] the currency used to display daily historical price.
      #
      # @return [Hash] returns the coin's daily historical price data within the number of days given.
      #
      # @example Fetch Bitcoin's daily historical price within the last 14 days.
      #   client.get_daily_historical_prices(id: 'bitcoin', days: 14)
      # @example Sample response object (truncated)
      #   {
      #     "prices" => [
      #       [1620000000000, 56600.74528738432], # [UNIX timestamp for minutely price data, coin price in given currency]
      #       [1620086400000, 57200.30029871162],
      #       [1620172800000, 53464.37021950372],
      #     ], "market_caps" => [
      #       [1620000000000, 1057850321948.5465],
      #       [1620086400000, 1069571255195.5189],
      #       [1620172800000, 999775008412.3738],
      #     ], "total_volumes" => [
      #       [1620000000000, 39072664393.929405],
      #       [1620086400000, 54132470274.07509],
      #       [1620172800000, 71296763919.13268],
      #     ]
      #   }
      def get_daily_historical_prices(id:, days:, currency: 'usd')
        get "coins/#{id}/market_chart", { vs_currency: currency, days: days, interval: 'daily' }
      end

      # Fetches a coin's open, high, low, and close (OHLC) data within the number of days given.
      # @param id [String] the coin id to fetch.
      # @param days [Integer, String] the number of days to fetch daily historical prices. Valid values: 1/7/14/30/90/180/365/'max'
      # @param currency [String] the currency to display OHLC data.
      #
      # @return [Array<Array<String, Float>>] returns the coin's OHLC data within the number of days given.
      #   If the number of days given is between 1-2 days, the OHLC data is returned in 30-minute intervals.
      #   If the number of days given is between 3-30 days, the OHLC data is returned in 4-hour intervals.
      #   If the number of days given is more than 30 days, the OHLC data is returned in 4-day intervals.
      #
      # @example Fetch Bitcoin's OHLC data in USD within the last 7 days.
      #   client.get_ohlc(id: 'bitcoin', days: 7, currency: 'usd')
      # @example Sample response object (truncated)
      #   [
      #     [1620547200000, 58384.27, 58384.27, 58384.27, 58384.27], # [UNIX timestamp for OHLC data, open, high, low, close]
      #     [1620561600000, 58022.03, 58214.96, 57943.18, 58048.35],
      #     [1620576000000, 57956.7, 57956.7, 56636.68, 57302.22],
      #   ]
      def get_ohlc(id:, days:, currency: 'usd')
        get "coins/#{id}/ohlc", { vs_currency: currency, days: days }
      end

      # Fetches the list of currencies currently supported by CoinGecko's API.
      #
      # @return [Array<String>] returns the list of currencies currently supported by CoinGecko's API.
      #
      # @example Fetch supported currencies.
      #   client.supported_currencies
      # @example Sample response object (truncated)
      #   [
      #     "btc",
      #     "eth",
      #     "yfi",
      #     "usd",
      #     "aud",
      #     "eur",
      #     "gbp",
      #   ]
      def supported_currencies
        get 'simple/supported_vs_currencies'
      end

      # Fetches the exchange rate for a coin or currency in the given coin or currency.
      # @param from [String] the coin id or currency to be converted.
      # @param to [String] the coin id or currency to convert against.
      #
      # @return [Hash] returns the coin's exchange rate against the given coin or currency.
      #
      # @example Fetch the exchange rate for BTC-USD.
      #   client.get_exchange_rate(from: 'bitcoin', to: 'usd')
      # @example Sample response object
      #   {
      #     "bitcoin" => {
      #       "usd" => 47931 # current price in given currency
      #     }
      #   }
      # @example Fetch the exchange rate for BTC-ETH.
      #   client.get_exchange_rate(from: 'bitcoin', to: 'eth')
      # @example Sample response object
      #   {
      #     "bitcoin" => {
      #       "eth" => 12.71434 # current price in given currency
      #     }
      #   }
      def get_exchange_rate(from:, to: 'usd')
        get_price(id: from, currency: to)
      end
    end
  end
end
