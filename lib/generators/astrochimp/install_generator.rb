module Astrochimp
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Move astrochimp configuration and layout in place"

      def copy_config_yml
        copy_file "../../../config/astrochimp.example.yml", "config/astrochimp.yml"
      end

      def add_astrochimp_routes
        route 'mount Astrochimp::Engine => "/"'
      end

      def show_readme
        readme "README" if behavior == :invoke
      end
    end
  end
end
