require_relative 'patches/mingleapi'

module MingleHelpers
  module API
    class Client < MingleAPI
      MingleAPI::Http.send(:include, MingleHelpers::Patches::HTTPPut)
      MingleAPI.send(:include, MingleHelpers::Patches::UpdateCard)

      attr_reader :server, :connection

      def initialize(server, user, hmac_token)
        # @server = server
        # @connection = MingleAPI.new(server, hmac: [user, hmac_token])
        super(server, hmac: [user, hmac_token])
      end

      # Returns an array of hashes
      # { :name, :identifier, :description }
      def projects
        super.collect(&:to_h)
      end

      # Returns the card URL
      def create_card(project, attrs)
        super(project, attrs).url
      end

      # Returns the card URL
      def update_card(project, card_num, attrs)
        super(project, card_num, attrs).url
      end
    end
  end
end
