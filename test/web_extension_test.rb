require "test_helper"
require "net/telnet"

module Sidekiq
  describe "RedisLog" do
    include Rack::Test::Methods

    def app
      Sidekiq::Web
    end

    before do
      Sidekiq.redis = REDIS
      Sidekiq.redis {|c| c.flushdb }
    end

    it 'can display home with redis log tab' do
      get '/redis'

      last_response.status.must_equal 200
      last_response.body.must_match /Sidekiq/
      last_response.body.must_match /Redis/
    end

    ## NOTE: requires redis localhost:6379 running
    it 'can capture redis log via telnet' do

      null_stream = File.open(File::NULL, "w")

      class RedisMonitor
        include Sinatra::RedisLogHelper
      end

      RedisMonitor.new.capture_redis null_stream, 'localhost', 6379, 30, 'QUIT'
    end
 end
end