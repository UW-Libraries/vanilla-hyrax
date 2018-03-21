#gem 'hyrax', '1.0.0.rc1'
#gem 'hyrax', :github => 'samvera/hyrax', :branch => 'master'
gem 'hyrax', :github => 'samvera/hyrax', :tag => 'v2.1.0.beta1'

run 'bundle install'

generate 'hyrax:install', '-f'

rails_command 'db:migrate'

# the following was for v2.1.0.alpha
#rails_command 'hyrax:workflow:load'

# the following is for v2.1.0.beta1 and higher
rails_command 'hyrax:default_collection_types:create'
