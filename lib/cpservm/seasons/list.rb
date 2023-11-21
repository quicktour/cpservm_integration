# frozen_string_literal: true

module Cpservm
  module Seasons
    class List < Base
      private

      def request(action = :get)
        connection.public_send(action, 'teamstatistic/api/season/list') do |req|
          req.headers["Authorization"] = "Bearer #{authorization.access_token}"
        end
      end

      def mock_request
        file = File.open './lib/cpservm/seasons/mock_files/list.json'
        JSON.load file
      end
    end
  end
end
