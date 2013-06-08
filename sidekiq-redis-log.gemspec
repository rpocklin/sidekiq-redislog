# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sidekiq/redislog/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Robert Pocklington"]
  gem.email         = ["rpocklin@gmail.com"]
  gem.description   = %q{View redis log for sidekiq on the web}
  gem.summary       = %q{Allows you to monitor the redis log of sidekiq to track what is happening under the covers.}
  gem.homepage      = "https://github.com/rpocklin/sidekiq-redislog/"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "sidekiq-redislog"
  gem.require_paths = ["lib"]
  gem.version       = Sidekiq::RedisLog::VERSION

  gem.add_dependency "sidekiq", ">= 2.2.1"
  gem.add_dependency "slim"
  gem.add_dependency "sinatra"
  gem.add_dependency "sprockets"

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rack-test"

end
