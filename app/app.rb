module APIs
  class App < Grape::API
    format :json
    prefix :api

    #
    # Rescues from request validation
    #
    rescue_from Grape::Exceptions::ValidationErrors do |e|
       Rack::Response.new([e.message.to_json], 400,  'Content-type' => 'application/json').finish
    end

    #
    # Rescues from ActiveRecord not found.
    #
    rescue_from ActiveRecord::RecordNotFound do |e|
      Rack::Response.new([], 404,  'Content-type' => 'application/json').finish
    end

    mount APIs::Todos
  end
end