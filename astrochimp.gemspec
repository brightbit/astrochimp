$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "astrochimp/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "astrochimp"
  s.version     = Astrochimp::VERSION
  s.authors     = ["Eric Boehs", "Vance Lucas", "Joshua Ogle"]
  s.email       = ["hello@brightbit.com"]
  s.homepage    = "http://brightbit.com/astrochimp"
  s.summary     = "Easy launch pages as a mountable Rails engine"
  s.description = "Astrochimp is a mountable rails engine that you can install as a gem to create a splash page that collects email
                   addresses and integrates with MailChimp to make sending launch notifications and teaser emails easy."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "hominid", "~> 3.0.5"
  s.add_dependency "jquery-rails"
end
