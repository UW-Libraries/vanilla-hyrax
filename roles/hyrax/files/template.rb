#gem 'hyrax', '1.0.0.rc1'
gem 'hyrax', :github => 'projecthydra-labs/hyrax', :branch => 'master'

run 'bundle install'

generate 'hyrax:install', '-f'

rails_command 'db:migrate'
rails_command 'hyrax:workflow:load'
