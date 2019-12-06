gsub_file 'Gemfile', /^gem ["']sqlite3["']$/, 'gem "sqlite3", "~> 1.3.0"'

#gem 'hyrax', '3.0.0-rc1'
#gem 'hyrax', :github => 'samvera/hyrax', :branch => 'master'
gem 'hyrax', :github => 'samvera/hyrax', :tag => 'v2.5.1'

run 'bundle install --path vendor/bundle'

generate 'hyrax:install', '-f'

rails_command 'db:migrate'
rails_command 'hyrax:default_collection_types:create'
