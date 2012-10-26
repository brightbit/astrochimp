module Astrochimp
  require 'hominid'
  require 'jquery-rails'

  class Engine < ::Rails::Engine
    isolate_namespace Astrochimp
  end
end
