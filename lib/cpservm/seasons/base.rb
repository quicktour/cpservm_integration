# frozen_string_literal: true

module Cpservm
  module Seasons
    class Base < BaseConnection

      def self.call(id = nil, lang = nil)
        new(id = nil, lang = nil).call()
      end

      def initialize(id, lang)
        @id = id
        @lang = lang
      end

      def call()
        authorization.reload if request(:head).status == 401

        JSON.parse(request(:get).body)
      end
    end
  end
end
