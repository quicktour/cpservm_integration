# frozen_string_literal: true

module Cpservm
  module Seasons
    class Info < Base
      private

      def request(action = :get)
        connection.public_send(action, 'teamstatistic/api/season/info') do |req|
          req.headers["Authorization"] = "Bearer #{authorization.access_token}",
          req.body = {
            id:  @id,
            lng: @lng
          }
        end
      end

      def mock_request
        file = File.open './lib/cpservm/seasons/mock_files/info.json'
        data = JSON.load file
        result = data['data'].select { |item| item['id'] == @id && item['lng'] == @lng }
        result.last['body']
      end
    end
  end
end
