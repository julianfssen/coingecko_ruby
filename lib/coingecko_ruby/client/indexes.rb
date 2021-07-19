module CoingeckoRuby
  class Client
    module Indexes
      # Fetches the list of market indexes listed in CoinGecko.
      #
      # @option options [Integer] :per_page (100) sets the number of results to return per page.
      # @option options [Integer] :page sets the page for results.
      #
      # @return [Array<Hash>] each index's id, name, market name, last done, and whether it's a multiasset composite index.
      #
      # @example Get all market indexes.
      #   client.indexes
      # @example Sample response object
      #   [
      #     {"name"=>"CoinFLEX (Futures) DFN",
      #     "id"=>"DFN",
      #     "market"=>"CoinFLEX (Futures)",
      #     "last"=>nil,
      #     "is_multi_asset_composite"=>nil},
      #    {"name"=>"Bibox (Futures) LINK",
      #     "id"=>"LINK",
      #     "market"=>"Bibox (Futures)",
      #     "last"=>nil,
      #     "is_multi_asset_composite"=>nil},
      #    {"name"=>"CME Bitcoin Futures BTC",
      #     "id"=>"BTC",
      #     "market"=>"CME Bitcoin Futures",
      #     "last"=>nil,
      #     "is_multi_asset_composite"=>false}
      #   ]
      def indexes(**options)
        get 'indexes', **options
      end

      # @deprecated Use {#indexes} instead
      def get_indexes(options: {})
        indexes(**options)
      end

      # Fetches the ids of market indexes listed in CoinGecko.
      #
      # @return [Array<Hash>] each index's id and name.
      #
      # @example Get all market index ids and names.
      #   client.index_ids
      # @example Sample response object
      #   [
      #    {"id"=>"LINK", "name"=>"Bibox (Futures) LINK"},
      #    {"id"=>"BTC", "name"=>"CME Bitcoin Futures BTC"},
      #    {"id"=>"XRP", "name"=>"Bibox (Futures) XRP"},
      #    {"id"=>"ETH", "name"=>"Crypto.com (Futures) ETH"}
      #   ]
      def index_ids
        get 'indexes/list'
      end

      # @deprecated Use {#index_ids} instead
      def get_indexes_ids
        index_ids
      end

      # Fetches the list of indexes based on the market and index given.
      #
      # @param market_id [String] filter results by the market id.
      # @param coin_id [String] filter indexes from the given market by the index id.
      #
      # @return [Array<Hash>] the index's name, market, last done, and whether it's a multiasset composite index.
      #
      # @example Get all BTC indexes in the CME Futures market.
      #   client.indexes_by_market_and_coin(market_id: 'cme_futures', coin_id: 'btc')
      # @example Sample response object
      #   {
      #     "name"=>"CME Bitcoin Futures BTC",
      #     "market"=>"CME Bitcoin Futures",
      #     "last"=>nil,
      #     "is_multi_asset_composite"=>false
      #   }
      def indexes_by_market_and_coin(market_id, coin_id, **options)
        get "indexes/#{market_id}/#{coin_id}", **options
      end

      # @deprecated Use {#indexes_by_market_and_coin} instead
      def get_indexes_by_market_and_index(market_id:, index_id:, options: {})
        indexes_by_market_and_index(market_id, index_id, **options)
      end
    end
  end
end
