module APIs
  module Params
    module Todos
      extend Grape::API::Helpers

      #
      # Validates the create params
      #
      params :create_params do
        requires :task, type: String, desc: "Task name"
        optional :done, type: Boolean, desc: "The task status (done or not done)"
      end

    end
  end
end