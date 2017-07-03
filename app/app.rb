module APIs
  class App < Grape::API
    format :json
    prefix :api

    mount APIs::Todos
  end
end