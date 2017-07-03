module API
  class App < Grape::API
    format :json

    mount API::Test
  end
end