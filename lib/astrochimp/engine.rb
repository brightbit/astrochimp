module Astrochimp
  require 'hominid'
  require 'jquery-rails'

  class Engine < ::Rails::Engine
    isolate_namespace Astrochimp

    initializer "astrochimp.load_app_instance_data" do |app|
      app.class.configure do |config|
        #Pull in all the migrations from Astrochimp to the application
        config.paths['db/migrate'] += Astrochimp::Engine.paths['db/migrate'].existent
      end
    end
  end
end
