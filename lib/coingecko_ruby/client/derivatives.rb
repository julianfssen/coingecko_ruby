module CoingeckoRuby
  class Client
    module Derivatives
      # Fetches the list of derivative products listed in CoinGecko.
      #
      # @option options [String] :include_tickers ('unexpired') determines whether to display all tickers or only show unexpired tickers. Valid values: all, unexpired
      #
      # @return [Array<Hash>] each derivative product's information.
      #
      # @example Get all unexpired derivatives.
      #   client.derivatives(include_tickers: 'unexpired')
      # @example Sample response object (truncated)
      #   [
      #     {
      #       "market" => "Binance (Futures)",
      #       "symbol" => "BTCUSDT",
      #       "index_id" => "BTC",
      #       "price" => "44575.26",
      #       "price_percentage_change_24h" => -0.5892545887194689,
      #       "contract_type" => "perpetual",
      #       "index" => 44646.70155337,
      #       "basis" => -0.11242030301843862,
      #       "spread" => 0.01,
      #       "funding_rate" => 0.021205,
      #       "open_interest" => 1822639548.16,
      #       "volume_24h" => 27179643527.25483,
      #       "last_traded_at" => 1621341447,
      #       "expired_at" => nil
      #     },
      #     {
      #       "market" => "Bybit",
      #       "symbol" => "BTCUSD",
      #       "index_id" => "BTC",
      #       "price" => "44817.5",
      #       "price_percentage_change_24h" => -0.9426664309079656,
      #       "contract_type" => "perpetual",
      #       "index" => 44827.57,
      #       "basis" => 0.022468901656718915,
      #       "spread" => 0.01,
      #       "funding_rate" => 0.01,
      #       "open_interest" => 1664013731.0,
      #       "volume_24h" => 5725694670.15,
      #       "last_traded_at" => 1621340931,
      #       "expired_at" => nil
      #     },
      #   ]
      def derivatives(**options)
        get 'derivatives', options
      end

      # @deprecated Use {#derivatives} instead
      def get_derivatives(options: {})
        derivatives(**options)
      end

      # Fetches the list of derivative exchanges listed in CoinGecko.
      #
      # @option options [Integer] :per_page sets the number of results to return per page.
      # @option options [Integer] :page sets the page for results.
      # @option options [String] :order sets the sort order for results. Valid values: name_asc, name_desc, open_interest_btc_asc, open_interest_btc_desc, trade_volume_24h_btc_asc, trade_volume_24h_btc_desc.
      #
      # @return [Array<Hash>] each derivative exchange's information.
      #
      # @example Get one derivative exchange.
      #   client.derivative_exchanges(per_page: 1)
      # @example Sample response object
      #   [{
      #     "name" => "Binance (Futures)",
      #     "id" => "binance_futures",
      #     "open_interest_btc" => 237845.78,
      #     "trade_volume_24h_btc" => "2209372.18",
      #     "number_of_perpetual_pairs" => 132,
      #     "number_of_futures_pairs" => 32,
      #     "image" =>
      #     "https://assets.coingecko.com/markets/images/466/small/binance_futures.jpg?1568609512",
      #     "year_established" => 2019,
      #     "country" => nil,
      #     "description" => "",
      #     "url" => "https://www.binance.com/"
      #   }]
      def derivative_exchanges(**options)
        get 'derivatives/exchanges', options
      end

      # @deprecated Use {#derivative_exchanges} instead
      def get_derivative_exchanges(options: {})
        derivative_exchanges(**options)
      end

      # Fetches data for a specific derivative exchange.
      #
      # @param id [String] the id of the derivative exchange.
      #
      # @option options [String] :include_tickers determines whether to display all tickers or only show unexpired tickers. Does not return any ticker data if left blank. Valid values: all, unexpired
      #
      # @return [Hash] the derivative exchange's information.
      #
      # @example Get data for the Binance Futures derivative exchange.
      #   client.derivative_exchange('binance_futures')
      # @example Sample response object
      #   {
      #     "name" => "Binance (Futures)",
      #     "open_interest_btc" => 237845.78,
      #     "trade_volume_24h_btc" => "2226117.02",
      #     "number_of_perpetual_pairs" => 132,
      #     "number_of_futures_pairs" => 32,
      #     "image" =>
      #     "https://assets.coingecko.com/markets/images/466/small/binance_futures.jpg?1568609512",
      #     "year_established" => 2019,
      #     "country" => nil,
      #     "description" => "",
      #     "url" => "https://www.binance.com/"
      #   }
      def derivative_exchange(id, **options)
        get "derivatives/exchanges/#{id}", options
      end

      # @deprecated Use {#derivative_exchange} instead
      def get_derivative_exchange(id:, options: {})
        derivative_exchange(id, **options)
      end

      # Fetches the list ids and names of derivative exchanges listed in CoinGecko.
      #
      # @return [Array<Hash>] each derivative exchange's id and name.
      #
      # @example Get all unexpired derivatives.
      #   client.derivative_exchanges_ids_and_names
      # @example Sample response object (truncated)
      #   [
      #     {
      #       "id" => "binance_futures",
      #       "name" => "Binance (Futures)"
      #     },
      #     {
      #       "id" => "huobi_dm",
      #       "name" => "Huobi Futures"
      #     },
      #     {
      #       "id" => "ftx",
      #       "name" => "FTX (Derivatives)"
      #     }
      #   ]
      def derivative_exchanges_ids_and_names
        get 'derivatives/exchanges/list'
      end

      # @deprecated Use {#derivative_exchanges_ids_and_names} instead
      def get_derivative_exchanges_ids_and_names
        derivative_exchanges_ids_and_names
      end
    end
  end
end
