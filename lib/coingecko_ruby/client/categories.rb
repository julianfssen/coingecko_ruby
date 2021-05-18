module CoingeckoRuby
  class Client
    module Categories
      # Fetches the list of coin categories in CoinGecko.
      #
      # @return [Array<Hash>] each category's id and name
      #
      # @example Get all coin categories.
      #   client.get_categories
      # @example Sample response object
      #   [{
      #     "category_id" => "recently_added",
      #     "name" => "Recently Added"
      #   }, {
      #     "category_id" => "aave-tokens",
      #     "name" => "Aave Tokens"
      #   }]
      def get_categories
        get 'coins/categories/list'
      end

      # Fetches the list of coin categories with its respective market data.
      #
      # @return [Array<Hash>] each category's id, name, and market data
      #
      # @example Get all coin categories with market data.
      #   client.get_categories_with_market_data
      # @example Sample response object
      #   [
      #     {
      #       "id" => "exchange-based-tokens",
      #       "name" => "Exchange-based Tokens",
      #       "market_cap" => 169371736001.31586,
      #       "market_cap_change_24h" => -0.0922414270544203,
      #       "volume_24h" => 15951052818.441586,
      #       "updated_at" => "2021-05-16T08:20:23.151Z"
      #     },
      #     {
      #       "id" => "decentralized-finance-defi",
      #       "name" => "Decentralized Finance (DeFi)",
      #       "market_cap" => 136820578041.49733,
      #       "market_cap_change_24h" => -0.9466181422841903,
      #       "volume_24h" => 14287923081.250826,
      #       "updated_at" => "2021-05-16T08:20:20.877Z"
      #     }
      #   ]
      def get_categories_with_market_data
        get 'coins/categories'
      end

      # Fetches the list of asset platforms (e.g. Ethereum, OpenLedger, Counterpart) listed in CoinGecko.
      #
      # @return [Array<Hash>] each asset platform's id, name, short name, and chain identifier
      #
      # @example Get all asset platforms.
      #   client.get_asset_platforms
      # @example Sample response object
      #   [
      #     {"id"=>"factom", "chain_identifier"=>nil, "name"=>"Factom", "shortname"=>""},
      #     {"id"=>"openledger",
      #      "chain_identifier"=>nil,
      #      "name"=>"OpenLedger",
      #      "shortname"=>""}
      #   ]
      def get_asset_platforms
        get 'asset_platforms'
      end
    end
  end
end
