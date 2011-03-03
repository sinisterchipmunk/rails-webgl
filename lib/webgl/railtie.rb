module WebGL
  class Railtie < Rails::Railtie
#    rake_tasks do
#      load 'webgl/rake_tasks.rb'
#    end

    initializer 'webgl' do |config|
      if Rails.env.production?
        WebGL.install
      else
        config.middleware.use '::ActionDispatch::Static', WebGL.public_path
      end
    end
    
    config.before_configuration do
      config.action_view.javascript_expansions[:webgl] = Dir[File.join(WebGL.public_path, "javascripts/**/*.js")].collect { |d| File.join("", d.gsub(Regexp::escape(WebGL.public_path), "")) }
    end
    
#    generators do
#      require File.join(WebGL.path, "generators/webgl/webgl_generator")
#    end
    
#    config.to_prepare do
#      ApplicationController.helper WebGL::Helper
#      ApplicationController.layout 'name'
#    end
  end
end
