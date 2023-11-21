# frozen_string_literal: true

module Cpservm
  module Seasons
    class Base < BaseConnection

      def self.call(**attr)
        new(attr[:id], attr[:lng], attr[:mock]).call()
      end

      def initialize(id, lng, mock)
        @id = id
        @lng = lng
        @mock = mock
      end

      def call()
        return mock_request if @mock

        authorization.reload if request(:head).status == 401
        JSON.parse(request(:get).body)
      end
    end
  end
end
