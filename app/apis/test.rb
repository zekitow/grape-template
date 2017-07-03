module APIs
  class Test < Grape::API

    resource :test do

      get '/' do
        User.all
      end

    end

  end
end