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
      #   client.get_finance_platforms
      # @example Sample response object
      def get_finance_platforms(options: {})
        get 'finance_platforms', { options: options }
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
      # @example Get all finance platforms.
      #   client.get_finance_products
      # @example Sample response object
      def get_finance_products(options: {})
        get 'finance_products', { options: options }
      end
    end
  end
end
