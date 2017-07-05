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

      desc 'Retrives one specific TO DO'
      get ':id' do
        Todo.find(params[:id])
      end

      desc 'Updates on specific TO DO'
      put ':id' do
        Todo.find(params[:id]).update!({
          task: params[:task],
          done: params[:done]
        })

        status 204
        nil
      end

    end

  end
end