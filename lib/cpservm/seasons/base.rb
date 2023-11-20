# frozen_string_literal: true

module Cpservm
  module Seasons
    class Base < BaseConnection

      def self.call()
        new().call()
      end

      def call()
        authorization.reload if request(:head).status == 401
        binding.break
        JSON.parse(request(:get).body)
      end
    end
  end
end
