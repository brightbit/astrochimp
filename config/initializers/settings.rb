config_yml         = "#{Rails.root}/config/astrochimp.yml"
config_example_yml = File.expand_path '../../astrochimp.example.yml', __FILE__

# Copy example config if there is not already one present
FileUtils.cp config_example_yml, config_yml if !File.exists?(config_yml)

# Load the current environmnts astrochimp configuration
config = YAML.load(File.read(config_yml))[Rails.env]

# Set environment variables based on config (not overiding already set ENVs)
config.each do |key, value|
  key = 'AC_' + key.upcase
  ENV[key] = value.to_s if !value.kind_of?(Hash) && ENV[key].blank?
end

#if File.basename($0) != 'rake'
  #unless ActiveRecord::Base.connection.table_exists?('astrochimp_signups')
    #raise "\n\nThe Chimp wants you to run rake db:migrate\n\n"
  #end

  #if ENV['AC_MAILCHIMP_API_KEY'].blank? || ENV['AC_MAILCHIMP_LIST_ID'].blank?
    #raise "\n\nThe Chimp wants you to set the ENV variables: AC_MAILCHIMP_API_KEY and AC_MAILCHIMP_LIST_ID.\n" <<
      #"You can also set them in astrochimp.yml if you're an ape.\n\n"
  #end
#end
