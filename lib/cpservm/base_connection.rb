# frozen_string_literal: true

module Cpservm
  class BaseConnection
    def connection
      @connection ||= ConnectionBuilder.build
    end

    def authorization
      @authorization ||= Authorization.instance
    end
  end
end
