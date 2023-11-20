# frozen_string_literal: true

module Cpservm
  class Authorization
    include Singleton

    def response_body
      JSON.parse(response.body)
    end

    private

    def response
      connection.post('/gateway/token') do |req|
        req.params['Content-Type'] = 'application/x-www-form-urlencoded'
        req.body = {
          client_id:     Rails.configuration.integration[:client_id].last,
          client_secret: Rails.configuration.integration[:secret_id].last
        }
      end
    end

    def connection
      @connection ||= Connection.call
    end
  end
end
