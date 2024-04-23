# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.configure do
     # Add any configurations here
     # For example, to configure Action Cable:
     # config.action_cable.url = "wss://example.com/cable"
     # config.action_cable.allowed_request_origins = ['http://example.com', /http:\/\/example.*/]
end

Rails.application.initialize!
