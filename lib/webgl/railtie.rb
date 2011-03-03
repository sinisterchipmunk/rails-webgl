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
      config.action_view.javascript_expansions[:webgl] = %w(
        sylvester
        sylvester-ext
        gl-utils
        webgl
        engine/core
        engine/assertions
        engine/vector
        engine/plane
        engine/frustum
        engine/camera
        objects/renderable
        systems/particle_system
        systems/particle_manager
        engine/shader
        engine/world
        engine/context
        engine/buffer
        engine/texture
        engine/mesh
        engine/text
        culling/octree
        objects/quad
        engine/video_texture
        engine/canvas_texture
        control/mouse_weight  
        control/keycodes
      )
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
