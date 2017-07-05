module APIs
  class Todos < Grape::API
    # includes params helpers
    helpers APIs::Params::Todos

    resource :todos do
      desc 'Retrive all TO DOs'
      get '/' do
        Todo.all
      end

      desc 'Created a new TO DO'
      params do
        use :create_params
      end
      post '/' do
        Todo.create(params)
      end
   
    end

  end
end