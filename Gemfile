source 'https://rubygems.org'

gem 'rails', '4.0.2'

### App Server ###
# gem 'unicorn'

### Datastore ###
gem 'pg'
gem 'devise',   '~> 3.2.2'

### Assets ###
gem 'haml-rails',        '~> 0.4'
gem 'sass-rails',        '~> 4.0.0'
gem 'coffee-rails',      '~> 4.0.0'
gem 'jquery-rails',      '~> 3.0.4'
gem 'uglifier',          '>= 1.3.0' # Compressor for JavaScript assets

### Documentation ###
group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end # end group

### Inline Console ###
group :development, :test do
  gem 'pry', '~> 0.9.12'
end # group

### Testing ###
group :test do
  gem 'rspec-rails',                 '~> 2.14.0'
  gem 'rspec-sleeping_king_studios', '>= 1.0.1'
  gem 'fuubar',                      '~> 1.2.1'
  gem 'factory_girl_rails',          '~> 4.2.0'
  gem 'database_cleaner',            '~> 1.2.0'
end # group

ruby "2.1.0"
