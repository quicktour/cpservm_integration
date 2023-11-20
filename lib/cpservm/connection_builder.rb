# frozen_string_literal: true

module Cpservm
  class ConnectionBuilder
    def self.build
      Faraday.new(
        url: 'https://cpservm.com/gateway/'
      )
    end
  end
end
