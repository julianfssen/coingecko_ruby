module CoingeckoRuby
  class Client
    module Exchanges
      # Fetches complete data for every exchange currently supported by the CoinGecko API.
      #
      # @option options [Integer] :per_page (100) sets the number of results to return per page.
      # @option options [Integer] :page sets the page for results.
      #
      # @return [Array<Hash>] returns an array of hashes of detailed exchange data.
      #
      # @example Fetch complete exchange data with 1 result per page.
      #   client.get_exchanges(options: { per_page: 1 })
      # @example Sample response object
      #   [{
      #     "id" => "binance",
      #     "name" => "Binance",
      #     "year_established" => 2017,
      #     "country" => "Cayman Islands",
      #     "description" => "",
      #     "url" => "https://www.binance.com/",
      #     "image" => "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250",
      #     "has_trading_incentive" => false,
      #     "trust_score" => 10,
      #     "trust_score_rank" => 1,
      #     "trade_volume_24h_btc" => 982949.3975723931,
      #     "trade_volume_24h_btc_normalized" => 982949.3975723931
      #   }]
      def get_exchanges(options: {})
        get 'exchanges', { options: options }
      end

      # Fetches complete data for a specific exchange.
      #
      # @param id [String] the exchange id to fetch.
      #
      # @return [Hash] returns detailed data for the given exchange.
      #
      # @example Fetch complete exchange data for Binance.
      #   client.get_exchange_data(id: 'binance')
      def get_exchange_data(id:)
        get "exchanges/#{id}"
      end

      # Fetches exchange ids for every exchange currently supported by the CoinGecko API.
      #
      # @return [Array<Hash>] returns an array of hashes of the exchange id and name.
      #
      # @example Fetch all exchange ids.
      #   client.get_exchanges_ids
      # @example Sample response object
      #   [{
      #     "id" => "aave",
      #     "name" => "Aave"
      #   }, {
      #     "id" => "aax",
      #     "name" => "AAX"
      #   }, {
      #     "id" => "aax_futures",
      #     "name" => "AAX Futures"
      #   }]
      def get_exchanges_ids
        get 'exchanges/list'
      end

      # Fetches coin tickers from a specific exchange.
      #
      # @param id [String] the exchange id to fetch.
      # @option options [String] :coin_ids comma-separated list of tickers to fetch from the given exchange id (e.g. 'bitcoin, eth, litecoin').
      # @option options [String] :include_exchange_logo includes the exchange's logo.
      # @option options [Integer] :page sets the page for results.
      # @option options [String] :order ('trust_score_desc') sets the sort order for results. Valid values: trust_score_desc', 'trust_score_asc', 'volume_desc.
      # @option options [Boolean] :depth (false) displays orderbook depth (2%).
      #
      # @return [Hash] the exchange name and tickers as provided or all tickers if coin_ids is not provided.
      #
      # @example Get Bitcoin tickers from Binance.
      #   client.get_exchange_tickers(id: 'binance', options: { coin_ids: 'bitcoin' })
      # @example Sample response object
      #   {
      #     "name" => "Binance", "tickers" => [{
      #       "base" => "BTC",
      #       "target" => "USDT",
      #       "market" => {
      #         "name" => "Binance", "identifier" => "binance", "has_trading_incentive" => false
      #       },
      #       "last" => 48890.78,
      #       "volume" => 86837.96789156958,
      #       "converted_last" => {
      #         "btc" => 0.99871776, "eth" => 12.706618, "usd" => 48867
      #       },
      #       "converted_volume" => {
      #         "btc" => 86727, "eth" => 1103417, "usd" => 4243490314
      #       },
      #       "trust_score" => "green",
      #       "bid_ask_spread_percentage" => 0.01002,
      #       "timestamp" => "2021-05-16T07:37:00+00:00",
      #       "last_traded_at" => "2021-05-16T07:37:00+00:00",
      #       "last_fetch_at" => "2021-05-16T07:37:00+00:00",
      #       "is_anomaly" => false,
      #       "is_stale" => false,
      #       "trade_url" => "https://www.binance.com/en/trade/BTC_USDT?ref=37754157",
      #       "token_info_url" => nil,
      #       "coin_id" => "bitcoin",
      #       "target_coin_id" => "tether"
      #     }]
      #   }
      def get_exchange_tickers(id:, options: {})
        get "exchanges/#{id}/tickers", { options: options }
      end

      # Fetches news,announcments, and updates from a specific exchange.
      #
      # @param id [String] the exchange id to fetch.
      # @option options [Integer] :per_page (100) sets the number of results to return per page.
      # @option options [Integer] :page sets the page for results.
      #
      # @return [Hash] the status update data for the given exchange.
      #
      # @example Get the last 3 status updates from Binance.
      #   client.get_exchange_status_updates(id: 'binance', options: { per_page: 1 })
      # @example Sample response object
      #   {
      #     "status_updates" => [{
      #       "description" => "Juventus and Paris Saint-Germain Fan Tokens on Binance Launchpool! \r\n\r\nFarm JUV and PSG tokens By Staking BNB, BUSD & CHZ Tokens\r\n\r\nClick here➡️ https://ter.li/JUV-and-PSG-tokens",
      #       "category" => "general",
      #       "created_at" => "2020-12-14T11:18:49.085Z",
      #       "user" => "Darc",
      #       "user_title" => "Marketing",
      #       "pin" => false,
      #       "project" => {
      #         "type" => "Market", "id" => "binance", "name" => "Binance", "image" => {
      #           "thumb" => "https://assets.coingecko.com/markets/images/52/thumb/binance.jpg?1519353250", "small" => "https://assets.coingecko.com/markets/images/52/small/binance.jpg?1519353250", "large" => "https://assets.coingecko.com/markets/images/52/large/binance.jpg?1519353250"
      #         }
      #       }
      #     }]
      #   }
      def get_exchange_status_updates(id:, options: {})
        get "exchanges/#{id}/status_updates", { options: options }
      end

      # Fetches trade volume data from a specific exchange.
      #
      # @param id [String] the exchange id to fetch.
      # @param days [Integer] number of days ago to fetch trade volume data.
      #
      # @return [Array<Array<Float, String>>] the exchange's trade volume data in 10-minute intervals, hourly intervals, or daily intervals depending on the number of days given
      #
      # @example Get Binance's trade volume from a day ago.
      #   client.get_exchange_volume(id: 'binance', days: 1)
      # @example Sample response object (truncated)
      #   [
      #     [1620550200000.0, "1005476.2667217359131632087795432176371669876601688256288859094077173967202827700534809705802"], # [UNIX timestamp for exchange trade volume data, trade volume]
      #     [1620553800000.0, "1018442.2775982988468591292487708941265043962519659923872972786095536137127193126138169804088"],
      #     [1620557400000.0, "1042158.4333253484568599192332614201045319574863305612009609211497295171074087677404153278624"]
      #   ]
      def get_exchange_volume(id:, days:)
        get "exchanges/#{id}/volume_chart", { days: days }
      end
    end
  end
end
