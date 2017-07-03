module APIs
  class Test < Grape::API

    resource :test do

      get '/' do
        { hello: 'world' }
      end

    end

  end
end