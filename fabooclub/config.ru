# This file is used by Rack-based servers to start the application.

ENV["rvm_path"] = "/usr/local/rvm"
ENV["GEM_PATH"] = "/usr/local/rvm/gems/ruby-1.9.1-p378:/usr/local/rvm/gems/ruby-1.9.1-p378@global"

require ::File.expand_path('../config/environment',  __FILE__)
run Fabooclub::Application
