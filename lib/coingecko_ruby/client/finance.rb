module CoingeckoRuby
  class Client
    module Finance
      # Fetches the list of finance platforms (e.g. Celsius Network, dYdX) listed in CoinGecko.
      #
      # @option options [Integer] :per_page (100) sets the number of results to return per page.
      # @option options [Integer] :page sets the page for results.
      #
      # @return [Array<Hash>] each finance platform's name, category, url, facts (description), and centralized status.
      #
      # @example Get all finance platforms.
      #   client.finance_platforms
      # @example Sample response object (truncated)
      #   [
      #     {
      #       "name"=>"Binance Staking",
      #       "facts"=>"",
      #       "category"=>"CeFi Platform",
      #       "centralized"=>true,
      #       "website_url"=>"https://www.binance.com/en/staking"
      #     },
      #     {
      #       "name"=>"Celsius Network",
      #       "facts"=>"",
      #       "category"=>"CeFi Platform",
      #       "centralized"=>true,
      #       "website_url"=>"https://celsius.network/"
      #     },
      #     {
      #       "name"=>"Cobo",
      #       "facts"=>"",
      #       "category"=>"CeFi Platform",
      #       "centralized"=>true,
      #       "website_url"=>"https://cobo.com/"
      #     }
      #   ]
      def finance_platforms(**options)
        get 'finance_platforms', **options
      end

      # @deprecated Use {#finance_platforms} instead
      def get_finance_platforms(options: {})
        finance_platforms(**options)
      end

      # Fetches the list of finance products (e.g. Binance Savings, Nexo, Fulcrum) listed in CoinGecko.
      #
      # @option options [Integer] :per_page (100) sets the number of results to return per page.
      # @option options [Integer] :page sets the page for results.
      # @option options [Integer] :start_at filter results based on the launch date of the product in UNIX timestamp format.
      # @option options [Integer] :end_at filter results based on the end date of the product in UNIX timestamp format.
      #
      # @return [Array<Hash>] each finance product's platform, identifier, supply and borrow rate percentage, and the product duration data.
      #
      # @example Get all finance products.
      #   client.finance_products
      # @example Sample response object (truncated)
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
      #     "redeem_at"=>0},
      #    {"platform"=>"Crypto.com",
      #     "identifier"=>"BAT",
      #     "supply_rate_percentage"=>"2.0",
      #     "borrow_rate_percentage"=>nil,
      #     "number_duration"=>nil,
      #     "length_duration"=>nil,
      #     "start_at"=>0,
      #     "end_at"=>0,
      #     "value_at"=>0,
      #     "redeem_at"=>0}
      #   ]
      def finance_products(**options)
        get 'finance_products', **options
      end

      # @deprecated Use {#finance_products} instead
      def get_finance_products(options: {})
        finance_products(**options)
      end
    end
  end
end
