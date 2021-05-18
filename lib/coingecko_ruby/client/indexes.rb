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
      #   client.get_indexes
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
      def get_indexes(options: {})
        get 'indexes', { options: options }
      end

      # Fetches the ids of market indexes listed in CoinGecko.
      #
      # @return [Array<Hash>] each index's id and name.
      #
      # @example Get all market index ids and names.
      #   client.get_indexes_ids
      # @example Sample response object
      #   [
      #    {"id"=>"LINK", "name"=>"Bibox (Futures) LINK"},
      #    {"id"=>"BTC", "name"=>"CME Bitcoin Futures BTC"},
      #    {"id"=>"XRP", "name"=>"Bibox (Futures) XRP"},
      #    {"id"=>"ETH", "name"=>"Crypto.com (Futures) ETH"}
      #   ]
      def get_indexes_ids
        get 'indexes/list'
      end

      # Fetches the list of indexes based on the market and index given.
      #
      # @param market_id [String] filter results by the market id.
      # @param index_id [String] filter indexes from the given market by the index id.
      #
      # @return [Array<Hash>] the index's name, market, last done, and whether it's a multiasset composite index.
      #
      # @example Get all BTC indexes in the CME Futures market.
      #   client.get_indexes_by_market_and_index(market_id: 'cme_futures', index_id: 'btc')
      # @example Sample response object
      #   {
      #     "name"=>"CME Bitcoin Futures BTC",
      #     "market"=>"CME Bitcoin Futures",
      #     "last"=>nil,
      #     "is_multi_asset_composite"=>false
      #   }
      def get_indexes_by_market_and_index(market_id:, index_id:, options: {})
        get "indexes/#{market_id}/#{index_id}", { options: options }
      end
    end
  end
end
