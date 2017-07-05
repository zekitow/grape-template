module APIs
  class Todos < Grape::API
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

      route_param :id do
        desc 'Retrives one specific TO DO'
        get do
          Todo.find(params[:id])
        end

        desc 'Updates on specific TO DO'
        put do

          Todo.find(params[:id]).update!({
            task: params[:task],
            done: params[:done]
          })

          render_no_content!
        end
      end

    end

  end
end