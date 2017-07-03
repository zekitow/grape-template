module APIs
  class App < Grape::API
    format :json
    prefix :api

    rescue_from Grape::Exceptions::ValidationErrors do |e|
       Rack::Response.new([e.message.to_json], 400,  'Content-type' => 'application/json').finish
    end

    mount APIs::Todos
  end
end