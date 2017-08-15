source 'https://rubygems.org'

ruby '2.4.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'puma', '~> 3.0'
gem 'rails', '~> 5.1.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'erubis'
gem 'execjs'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'therubyracer', platforms: :ruby
gem 'turbolinks', '~> 5'
# gem 'webpacker' # https://github.com/rails/webpacker

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'activerecord-import'
gem 'aws-sdk'
gem 'bootstrap', '~> 4.0.0.beta'
source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.3.3'
end

gem 'bootstrap-datepicker-rails', require: 'bootstrap-datepicker-rails',
                                  git: 'git://github.com/Nerian/bootstrap-datepicker-rails.git'
gem 'capybara'
gem 'declarative_authorization', git: 'git://github.com/krlgrgn/declarative_authorization.git'
gem 'devise', git: 'git://github.com/plataformatec/devise.git'
gem 'dotenv-rails'
gem 'font-awesome-rails', git: 'git://github.com/bokmann/font-awesome-rails.git'
gem 'kaminari'
gem 'modernizr-rails'
gem 'omniauth-facebook'
gem 'pg'
gem 'rails_admin'
gem 'seed-fu'
gem 'sidekiq'
gem 'smarter_csv'
gem 'wicked'
gem 'workflow'
gem 'rails-rename', '~> 1.0.0' # rails g rename NewAppName

group :development, :test do
  gem 'byebug', platform: :mri # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'factory_girl_rails'
  gem 'listen', '~> 3.0.5'
  gem 'database_cleaner'
  gem 'faker'
  gem 'launchy'
  gem 'poltergeist'
  gem 'pry'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.5'
  gem 'rubocop'
  gem 'rubocop-rspec'
  gem 'simplecov'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'vcr'
  gem 'webmock'
  gem 'rack-mini-profiler'
  gem 'rspec-sidekiq'
end

group :production do
  # Use Redis adapter to run Action Cable in production
  # gem 'redis', '~> 3.0'
  gem 'rails_12factor'
  gem 'rails_serve_static_assets'
  gem 'rollbar'
end
