module CoingeckoRuby
  class Client
    module Events
      # Fetches the list of events listed in CoinGecko.
      # @todo CoinGecko API is not returning any list of events. Investigate why this is happening.
      #
      # @option options [String] :country_code country code to fetch list of events from.
      # @option options [String] :type type of event to fetch.
      # @option options [Integer] :page sets the page for results.
      # @option options [Boolean] :upcoming_events_only (true) determines whether to fetch upcoming events only or all events.
      # @option options [String] :from_date fetch events after the specified date. Date must be in the format of yyyy-mm-dd
      # @option options [String] :to_date fetch events before the specified date. Date must be in the format of yyyy-mm-dd
      #
      # @return [Array<Hash>] each finance platform's name, category, url, facts (description), and centralized status.
      #
      # @example Get all upcoming events.
      #   client.events(upcoming_events_only: true) 
      def events(**options)
        get 'events', **options
      end

      # @deprecated Use {#events} instead
      def get_events(options: {})
        events(**options)
      end

      # Fetches the valid list of countries to fetch events from.
      #
      # @return [Hash] each country's name and code and the total country count.
      #
      # @example Get all event countries.
      #   client.event_countries
      # @example Sample response object (truncated)
      #   {
      #     "data" => [{
      #         "country" => nil,
      #         "code" => ""
      #       },
      #       {
      #         "country" => "Malaysia",
      #         "code" => "MY"
      #       },
      #       {
      #         "country" => "Singapore",
      #         "code" => "SG"
      #       },
      #       {
      #         "country" => "United States",
      #         "code" => "US"
      #       }
      #     ],
      #     "count" => 4
      #   }
      def event_countries
        get 'events/countries'
      end

      # @deprecated Use {#event_countries} instead
      def get_event_countries
        event_countries
      end

      # Fetches the valid list of events to fetch.
      #
      # @return [Array<Hash>] the list of event types and total event types count.
      #
      # @example Get all event types.
      #   client.event_types
      # @example Sample response object
      #   {
      #     "data" => ["Event", "Conference", "Meetup"],
      #     "count" => 3
      #   }
      def event_types
        get 'events/types'
      end

      # @deprecated Use {#event_types} instead
      def get_event_types
        event_types
      end
    end
  end
end
