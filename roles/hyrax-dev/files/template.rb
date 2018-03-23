#gem 'hyrax', '1.0.0.rc1'
#gem 'hyrax', :github => 'samvera/hyrax', :branch => 'master'
gem 'hyrax', :github => 'samvera/hyrax', :tag => 'v2.1.0.beta1'

run 'bundle install --path vendor/bundle'

generate 'hyrax:install', '-f'

rails_command 'db:migrate'
#rails_command 'hyrax:workflow:load'
rails_command 'hyrax:default_collection_types:create'
