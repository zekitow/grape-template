module APIs
  class Todos < Grape::API
    resource :todos do

      desc 'Retrive all TO DOs'
      get '/' do
        Todo.all
      end

      desc 'Created a new TO DO'
      params do
        requires :task, type: String, desc: "Task name"
        optional :done, type: Boolean, desc: "The task status (done or not done)"
      end
      post '/' do 
        Todo.create(params)
      end
   
    end

  end
end