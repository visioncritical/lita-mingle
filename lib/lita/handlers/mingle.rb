module Lita
  module Handlers
    class Mingle < Handler
      include ::MingleHelpers::API
      include ::MingleHelpers::Regex

      config :server, required: true
      config :user, required: true
      config :hmac_token, required: true
      config :administrator, default: 'your Mingle administrator'

      route(
        /\A#{LIST_PROJECTS_PATTERN}\z/,
        :list_projects,
        command: false,
        help: { t('project.list.help.syntax') => t('project.list.help.desc') }
      )

      route(
        /\A#{CREATE_CARD_PATTERN}\z/,
        :create_card,
        command: false,
        help: { t('card.create.help.syntax') => t('card.create.help.desc') }
      )

      route(
        /\A#{UPDATE_CARD_PATTERN}\z/,
        :update_card,
        command: false,
        help: { t('card.update.help.syntax') => t('card.update.help.desc') }
      )

      def list_projects(response)
        mingle = Client.new config.server, config.user, config.hmac_token
        projects = mingle.projects
        message = projects.each.inject('') do |list, hash|
          list << t('project.list.reply', id: hash[:identifier], name: hash[:name]) + "\n"
          list
        end
        response.reply message.prepend 'PROJECT ID -- NAME' + "\n"
      rescue
        response.reply t('project.list.error', administrator: config.administrator)
      end

      def create_card(response)
        data = response.match_data
        begin
          mingle = Client.new config.server, config.user, config.hmac_token
          url = mingle.create_card data['project'], name: data['name'], type: data['card_type']
          response.reply t('card.create.reply', url: url)
        rescue
          response.reply t('card.create.error', administrator: config.administrator)
        end
      end

      def update_card(response)
        data = response.match_data
        begin
          mingle = Client.new config.server, config.user, config.hmac_token
          card = mingle.card(data['project'], data['card_num']).to_h
          url = mingle.update_card data['project'], data['card_num'], name: card[:name],
                                                                      type: card[:type],
                                                                      description: data['description']
          response.reply t('card.update.reply', url: url)
        rescue
          response.reply t('card.update.error', administrator: config.administrator)
        end
      end

      Lita.register_handler(self)
    end
  end
end
