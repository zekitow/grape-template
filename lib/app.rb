module API
  class App < Grape::API
    format :json
    prefix :api

    mount API::Test
  end
end