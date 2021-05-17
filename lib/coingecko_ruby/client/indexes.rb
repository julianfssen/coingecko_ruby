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

      # Fetches the list of market indexes based on the market and index given.
      #
      # @param market_id [String] filter results by the market id.
      # @param index_id [String] filter indexes from the given market by the index id.
      #
      # @return [Array<Hash>] each finance product's platform, identifier, supply and borrow rate percentage, and the product duration data.
      #
      # @example Get all market indexes in Binance that includes ETH.
      #   client.get_indexes_by_market_and_index(market_id: 'binance', index_id: 'eth')
      # @example Sample response object
      #   [
      #     {"platform"=>"Binance Savings",
      #     "identifier"=>"XTZ001",
      #     "supply_rate_percentage"=>"1.956035",
      #     "borrow_rate_percentage"=>nil,
      #     "number_duration"=>nil,
      #     "length_duration"=>nil,
      #     "start_at"=>0,
      #     "end_at"=>0,
      #     "value_at"=>0,
      #     "redeem_at"=>0},
      #    {"platform"=>"Binance Savings",
      #     "identifier"=>"ZEC001",
      #     "supply_rate_percentage"=>"0.182865",
      #     "borrow_rate_percentage"=>nil,
      #     "number_duration"=>nil,
      #     "length_duration"=>nil,
      #     "start_at"=>0,
      #     "end_at"=>0,
      #     "value_at"=>0,
      #     "redeem_at"=>0}
      #   ]
      def get_indexes_by_market_and_index(market_id:, index_id:, options: {})
        get "indexes/#{market_id}/#{index_id}", { options: options }
      end

      def get_indexes_ids_by_market_and_index(market_id:, index_id:, options: {})
        get "indexes/list_by_market_and_id/#{market_id}/#{index_id}", { options: options }
      end
    end
  end
end
