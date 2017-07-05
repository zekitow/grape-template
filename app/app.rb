module APIs
  class App < Grape::API
    format :json
    prefix :api
    
    helpers APIs::Helpers::ApplicationHelper
    rescue_from Grape::Exceptions::ValidationErrors, with: -> (e) { render_validation_error!(e) }
    rescue_from ActiveRecord::RecordNotFound,        with: -> { render_not_found! }

    http_basic do |username, password|
      ($auth_username == username and $auth_password == password)
    end

    mount APIs::Todos
  end
end