module APIs
  class Todos < Grape::API

    resource :todos do

      get '/' do
        Todo.all
      end

    end

  end
end