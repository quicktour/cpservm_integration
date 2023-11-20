# frozen_string_literal: true

module Cpservm
  class Connection
    def self.call
      Faraday.new(
        url: 'https://cpservm.com'
      )
    end
  end
end
