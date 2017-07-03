module API
  class App < Grape::API
    mount API::Test
  end
end