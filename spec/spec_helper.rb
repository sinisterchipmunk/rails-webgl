$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))


require 'rspec'
require 'rails-webgl'
#require 'genspec'
require 'rails/application'
require 'rails/all'
#require 'action_controller/railtie'
require 'rspec/rails'
require 'webrat/core/matchers'

class WebGL::MockApplication < Rails::Application
  config.active_support.deprecation = :stderr
  config.root = File.join(File.dirname(__FILE__), "support/mock_env")
  config.paths.app.views = File.join(File.dirname(__FILE__), "support/views")
end

WebGL::MockApplication.initialize!

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  
end
