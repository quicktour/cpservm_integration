# frozen_string_literal: true

module Cpservm
  class Authorization
    include Singleton

    def access_token
      response_body['access_token']
    end

    def expires_in
      response_body['expires_in']
    end

    def reload
      @response_body = nil
    end

    private

    def response_body
      @response_body ||= JSON.parse(request.body)
    end

    def request
      connection.post('token/') do |req|
        req.params['Content-Type'] = 'application/x-www-form-urlencoded'
        req.body = {
          client_id:     Rails.configuration.integration[:client_id].last,
          client_secret: Rails.configuration.integration[:secret_id].last
        }
      end
    end

    def connection
      @connection ||= ConnectionBuilder.build
    end
  end
end
