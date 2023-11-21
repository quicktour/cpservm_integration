# frozen_string_literal: true

module Cpservm
  module Seasons
    class Info < Base
      private

      def request(action = :get)
        connection.public_send(action, 'teamstatistic/api/season/info') do |req|
          req.headers["Authorization"] = "Bearer #{authorization.access_token}",
          req.body = {
            id:   @id,
            lang: @lang
          }
        end
      end
    end
  end
end
