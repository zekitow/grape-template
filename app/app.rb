module APIs
  class App < Grape::API
    format :json
    prefix :api

    mount APIs::Test
  end
end