require "sidekiq/web"
require "sidekiq/redislog/version"
require "sidekiq/redislog/redis_log_helper"
require "sidekiq/redislog/web_extension"

module Sidekiq
  module RedisLog
  end
end

Sidekiq::Web.register Sidekiq::RedisLog::WebExtension

if Sidekiq::Web.tabs.is_a?(Array)
  # For sidekiq < 2.5
  Sidekiq::Web.tabs << "redis"
else
  Sidekiq::Web.tabs["Redis"] = "redis"
end