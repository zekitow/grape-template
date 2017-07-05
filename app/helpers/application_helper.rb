module APIs
  module Helpers
    module ApplicationHelper
      extend Grape::API::Helpers

      #
      # Returns the no-content http status
      #
      def render_no_content!
        status(204)
        nil
      end

      #
      # Renders the default validation error
      #
      def render_validation_error!(e)
        Rack::Response.new([e.message.to_json], 400,  'Content-type' => 'application/json').finish
      end

      #
      # Renders the default not found error
      #
      def render_not_found!
        Rack::Response.new([], 404,  'Content-type' => 'application/json').finish
      end

    end
  end
end