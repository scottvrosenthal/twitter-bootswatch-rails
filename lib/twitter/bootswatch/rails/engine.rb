require 'rails'

module Twitter
  module Bootswatch
    module Rails
      class Engine < ::Rails::Engine

        initializer 'twitter-bootswatch-rails.setup',
          after: 'less-rails.after.load_config_initializers', 
          group:  :all do |app|

            paths = %W[
              #{File.join(config.root, 'vendor', 'toolkit')}
            ]

            paths.each do |p|
              app.config.assets.paths << p
              app.config.less.paths << p
            end

          end

        initializer 'twitter-bootswatch-rails.setup_helpers' do |app|
          app.config.to_prepare do

          end
        end
      end
    end
  end
end
