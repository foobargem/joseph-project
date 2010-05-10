# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Fabooclub::Application.initialize!

CYWORLD_CONFIG = YAML.load_file("#{Rails.root}/config/cyworld.yml")
