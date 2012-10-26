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

