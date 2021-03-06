module Sidekiq
  module RedisLog
    module WebExtension

      def self.registered(app)

        app.helpers Sinatra::RedisLogHelper

        app.get "/redis" do
          view_path = File.join(File.expand_path("..", __FILE__), "views")

          if Sidekiq::VERSION < "2.14.0"
            render(:slim, File.read(File.join(view_path, "sidekiq_redis_log.slim")))
          else
            render(:erb, File.read(File.join(view_path, "sidekiq_redis_log.erb")))
          end

        end

        app.get "/redis_log_stream", provides: 'text/event-stream' do

          set_sse_headers response
          config = get_redis_config

          stream :keep_open do |stream|
            capture_redis stream, config[:host], config[:port] do |data|
              stream << "event: redis_log\n"
              stream << "data: #{data}\n\n"
            end
          end
        end
      end
    end
  end
end
