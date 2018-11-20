source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'dotenv-rails', '~> 2.5'
gem 'kaminari', '~> 1.1', '>= 1.1.1'
gem 'mini_magick', '~> 4.9', '>= 4.9.2'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.8', '>= 3.8.1'
  gem 'spring-commands-rspec', '~> 1.0', '>= 1.0.4'
  gem 'capybara', '~> 3.11', '>= 3.11.1'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.2'
  gem 'faker', '~> 1.9', '>= 1.9.1'
  gem 'database_cleaner', '~> 1.7'
  gem 'poltergeist', '~> 1.18', '>= 1.18.1'
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.2'
  gem 'vcr', '~> 4.0'
  gem 'webmock', '~> 3.4', '>= 3.4.2'
end

gem 'factory_bot_rails', '~> 4.11', '>= 4.11.1'
gem 'simplecov', '~> 0.16.1'

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
