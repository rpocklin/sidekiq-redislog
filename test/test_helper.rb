Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

require "minitest/autorun"
require "minitest/spec"
require "minitest/mock"

require "rack/test"
require "sidekiq"
require "sidekiq-redislog"

Sidekiq.logger.level = Logger::ERROR

REDIS = Sidekiq::RedisConnection.create(:url => "redis://localhost/15", :namespace => 'sidekiq_redis_log')
