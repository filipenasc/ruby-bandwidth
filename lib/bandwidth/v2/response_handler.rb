module Bandwidth
  module V2
    class ResponseHandler
      def initialize(response)
        @response = response
      end

      # Check response object and raise error if status code >= 400
      # @param response response object
      def check_response
        return if @response.status < 400

        parsed_body = JSON.parse(@response.body)
        raise Errors::GenericError.new(parsed_body['errorCode'], parsed_body['description'])
      end
    end
  end
end