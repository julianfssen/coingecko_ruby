module CoingeckoRuby
  class Client
    module Coins
      # Fetches the id, name, and symbol of every coin supported by CoinGecko's API.
      #
      # @option options include_platform [Boolean] displays the coin's platform contract address (e.g. 0x... for ETH-based tokens) 
      #
      # @return [Array<Hash>] returns an array of hashes for every supported coin's id, name, symbol, and platform contract address (optional).
      #
      # @example Fetch the list of coins supported by CoinGecko's API.
      #   client.coins_list
      # @example Sample response object (truncated)
      #   [
      #     {
      #       "id" => "01coin",
      #       "symbol" => "zoc",
      #       "name" => "01coin"
      #     }, {
      #       "id" => "0-5x-long-algorand-token",
      #       "symbol" => "algohalf",
      #       "name" => "0.5X Long Algorand Token"
      #     }, {
      #   ]
      def coins_list(**options)
        get 'coins/list', **options
      end

      # Fetches detailed current data for a coin.
      # @param id [String] the coin id to fetch.
      # @option options [Boolean] :tickers (true) include ticker data (e.g. BTC-ETH).
      # @option options [Boolean] :market_data (true) include market data (e.g. market cap).
      # @option options [Boolean] :community_data (true) include community data (e.g. subreddit info, discussion forums).
      # @option options [Boolean] :developer_data (true) include developer data (e.g. Github stats).
      # @option options [Boolean] :sparkline (false) include sparkline data from the last 7 days.
      #
      # @return [Hash] returns comprehensive current data for the given coin.
      #
      # @example Fetch Bitcoin's current data.
      #   client.coin('bitcoin')
      def coin(id, **options)
        get "coins/#{id}", **options
      end

      # @deprecated Use {#coin} instead
      def get_coin_data(id:, options: {})
        coin(id, **options)
      end

      # Fetches the list of tickers (e.g: BTC-USD) for a coin
      #
      # @param id [String] the coin id to fetch.
      # @option options [String] :exchange_ids filter ticker results from the given exchange ids (e.g. 'binance, bitfinex').
      # @option options [Boolean] :include_exchange_logo flag to show the exchange's logo.
      # @option options [Integer] :page sets the page for results.
      # @option options [String] :order ('trust_score_desc') sets the sort order for results. Valid values: trust_score_desc', 'trust_score_asc', 'volume_desc.
      # @option options [Boolean] :depth (false) displays orderbook depth (2%).
      #
      # @return [Hash] returns the list of tickers for the given coin.
      #
      # @example Fetch Bitcoin's tickers.
      #   client.tickers('bitcoin')
      # @example Sample response object (truncated)
      #   {
      #     "name" => "Bitcoin",
      #     "tickers" => [{
      #       "base" => "BTC",
      #       "target" => "USDT",
      #       "market" => {
      #         "name" => "FTX.US",
      #         "identifier" => "ftx_us",
      #         "has_trading_incentive" => false
      #       },
      #       "last" => 48953.0,
      #       "volume" => 206.41378108798236,
      #       "converted_last" => {
      #         "btc" => 0.99774619, "eth" => 12.641434, "usd" => 48956
      #       },
      #       "converted_volume" => {
      #         "btc" => 205.949, "eth" => 2609, "usd" => 10105129
      #       },
      #       "trust_score" => "green",
      #       "bid_ask_spread_percentage" => 0.059238,
      #       "timestamp" => "2021-05-16T07:02:40+00:00",
      #       "last_traded_at" => "2021-05-16T07:02:40+00:00",
      #       "last_fetch_at" => "2021-05-16T07:02:40+00:00",
      #       "is_anomaly" => false,
      #       "is_stale" => false,
      #       "trade_url" => "https://ftx.us/trade/BTC/USDT",
      #       "token_info_url" => nil,
      #       "coin_id" => "bitcoin",
      #       "target_coin_id" => "tether"
      #     }],
      #   }
      # @example Fetch Bitcoin's tickers from Binance with 2% orderbook depth data.
      #   client.tickers('bitcoin', exchange_id: 'binance', depth: true)
      # @example Sample response object (truncated)
      #   {
      #     "name" => "Bitcoin",
      #     "tickers" => [{
      #       "base" => "BTC",
      #       "target" => "USDT",
      #       "market" => {
      #         "name" => "FTX.US",
      #         "identifier" => "ftx_us",
      #         "has_trading_incentive" => false
      #       },
      #       "last" => 48953.0,
      #       "volume" => 206.41378108798236,
      #       "cost_to_move_up_usd" => 41991391.6823387,
      #       "cost_to_move_down_usd" => 44281410.3725698,
      #       "converted_last" => {
      #         "btc" => 0.99774619, "eth" => 12.641434, "usd" => 48956
      #       },
      #       "converted_volume" => {
      #         "btc" => 205.949, "eth" => 2609, "usd" => 10105129
      #       },
      #       "trust_score" => "green",
      #       "bid_ask_spread_percentage" => 0.059238,
      #       "timestamp" => "2021-05-16T07:02:40+00:00",
      #       "last_traded_at" => "2021-05-16T07:02:40+00:00",
      #       "last_fetch_at" => "2021-05-16T07:02:40+00:00",
      #       "is_anomaly" => false,
      #       "is_stale" => false,
      #       "trade_url" => "https://ftx.us/trade/BTC/USDT",
      #       "token_info_url" => nil,
      #       "coin_id" => "bitcoin",
      #       "target_coin_id" => "tether"
      #     }],
      #   }
      def tickers(id, **options)
        get "coins/#{id}/tickers", **options
      end

      # @deprecated Use {#tickers} instead
      def get_tickers(id:, options: {})
        tickers(id, **options)
      end

      # Fetches market data for a coin or a list of coins.
      #
      # @param ids [String] the coin id or ids to fetch.
      # @option options [String] :vs_currency the currency to display market price data.
      # @option options [String] :category filter results by the given coin category.
      # @option options [String] :order ('market_cap_desc') sets the sort order for results. Valid values: market_cap_desc, gecko_desc, gecko_asc, market_cap_asc, market_cap_desc, volume_asc, volume_desc, id_asc, id_desc.
      # @option options [Integer] :per_page (100) sets the number of results to return per page.
      # @option options [Integer] :page sets the page for results.
      # @option options [Boolean] :sparkline (false) include sparkline data from the last 7 days.
      # @option options [String] :price_change_percentage include price change percentage for each coin. Valid values: 1h, 24h, 7d, 14d, 30d, 200d, 1y.
      #
      # @return [Array<Hash>] returns market data for the given coin or coins.
      #
      # @example Fetch market data for Bitcoin and Ethereum in USD.
      #   client.markets('bitcoin, ethereum', vs_currency: 'gbp')
      # @example Sample response object
      #   [{
      #       "id" => "bitcoin",
      #       "symbol" => "btc",
      #       "name" => "Bitcoin",
      #       "image" =>
      #       "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
      #       "current_price" => 34781,
      #       "market_cap" => 651147609834,
      #       "market_cap_rank" => 1,
      #       "fully_diluted_valuation" => 730792236092,
      #       "total_volume" => 47231436126,
      #       "high_24h" => 35335,
      #       "low_24h" => 33105,
      #       "price_change_24h" => 41.43,
      #       "price_change_percentage_24h" => 0.11926,
      #       "market_cap_change_24h" => 1033983115,
      #       "market_cap_change_percentage_24h" => 0.15905,
      #       "circulating_supply" => 18711337.0,
      #       "total_supply" => 21000000.0,
      #       "max_supply" => 21000000.0,
      #       "ath" => 47095,
      #       "ath_change_percentage" => -26.10691,
      #       "ath_date" => "2021-04-14T11:54:46.763Z",
      #       "atl" => 43.9,
      #       "atl_change_percentage" => 79166.25611,
      #       "atl_date" => "2013-07-05T00:00:00.000Z",
      #       "roi" => nil,
      #       "last_updated" => "2021-05-16T07:07:38.393Z"
      #     },
      #     {
      #       "id" => "ethereum",
      #       "symbol" => "eth",
      #       "name" => "Ethereum",
      #       "image" =>
      #       "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880",
      #       "current_price" => 2737.81,
      #       "market_cap" => 318383298158,
      #       "market_cap_rank" => 2,
      #       "fully_diluted_valuation" => nil,
      #       "total_volume" => 43302287477,
      #       "high_24h" => 2812.64,
      #       "low_24h" => 2579.9,
      #       "price_change_24h" => -67.10729241,
      #       "price_change_percentage_24h" => -2.39249,
      #       "market_cap_change_24h" => -7076221191.603394,
      #       "market_cap_change_percentage_24h" => -2.17422,
      #       "circulating_supply" => 115894196.749,
      #       "total_supply" => nil,
      #       "max_supply" => nil,
      #       "ath" => 3090.18,
      #       "ath_change_percentage" => -11.07563,
      #       "ath_date" => "2021-05-12T14:41:48.623Z",
      #       "atl" => 0.280314,
      #       "atl_change_percentage" => 980202.46141,
      #       "atl_date" => "2015-10-20T00:00:00.000Z",
      #       "roi" => {
      #         "times" => 104.29403414512163,
      #         "currency" => "btc",
      #         "percentage" => 10429.403414512162
      #       },
      #       "last_updated" => "2021-05-16T07:06:00.946Z"
      #     }
      #   ]
      def markets(ids, **options)
        get 'coins/markets', ids: ids, **options
      end

      # @deprecated Use {#markets} instead
      def get_markets(ids:, currency: 'usd', options: {})
        markets(ids, vs_currency: currency, **options)
      end
    end
  end
end
