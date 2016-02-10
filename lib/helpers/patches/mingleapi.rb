module MingleHelpers
  module Patches
    module HTTPPut
      def put(url, params)
        process(Net::HTTP::Put::Multipart, url, params)
      end
    end

    module UpdateCard
      def update_card(project, card_num, attrs)
        params = [
          ['card[name]', attrs[:name]],
          ['card[card_type_name]', attrs[:type]],
          ['card[description]', attrs[:description]]
        ]
        Array(attrs[:attachments]).each_with_index do |attachment, i|
          path, content_type = attachment
          params << ["attachments[#{i}]", UploadIO.new(File.new(path), content_type, File.basename(path))]
        end
        Array(attrs[:properties]).each_with_index do |prop, _i|
          name, value = prop
          params << ['card[properties][][name]', name]
          params << ['card[properties][][value]', value]
        end
        @http.put(v2(:projects, project_identifier(project), :cards, card_num), params)
        OpenStruct.new(number: card_num, url: url('projects', project_identifier(project), 'cards', card_num))
      end
    end
  end
end
