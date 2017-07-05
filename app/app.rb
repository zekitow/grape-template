module APIs
  class App < Grape::API
    format :json
    prefix :api
    
    helpers APIs::Helpers::ApplicationHelper
    rescue_from Grape::Exceptions::ValidationErrors, with: -> (e) { render_validation_error!(e) }
    rescue_from ActiveRecord::RecordNotFound,        with: -> { render_not_found! }

    mount APIs::Todos
  end
end