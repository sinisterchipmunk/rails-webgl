$:.unshift(File.dirname(__FILE__))

require 'rails'
require 'webgl/railtie'

module WebGL
  class << self
    def path
      File.expand_path(File.join(File.dirname(__FILE__), '..'))
    end
    
    def public_path
      File.join(path, 'public')
    end
    
    # Copies static resources (JavaScripts, CSS, etc.) to the Rails public directory.
    #
    # IMPORTANT:
    #
    # I've decided to replace this method with a manually-fired Rails generator when I get time.
    # This way I don't step on developers' toes if they make customizations to the static files.
    #
    def install
      Dir[File.join(public_path, '*')].each do |source|
        dest = File.join(Rails.root, 'public', source.sub(public_path, ''))
        
        # Don't copy if the dest file exists, and is newer than the source.
        next if File.file?(dest) && File.stat(dest).mtime >= File.stat(source).mtime

        if File.directory?(source)
          FileUtils.cp_r source.concat('/.'), dest
        else
          FileUtils.cp source, dest
        end
      end
    end
  end
end
