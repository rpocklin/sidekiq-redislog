module Sinatra
  module RedisLogHelper
    def set_sse_headers response

      response.headers.delete('Content-Length') # no content length
      response.headers['X-Accel-Buffering'] = 'no' # for nginx
      response.headers["Connection"]    = "keepalive" #optimisation
      response.headers["Cache-Control"] = "no-cache, no-store" #important for browsers
      response.headers['Last-Modified'] = Time.now.to_s # #fixes buffering

    end

    def capture_redis stream, host = 'localhost', port = 6379, timeout = 30, command = 'MONITOR'

      telnet_session = Net::Telnet::new("Host" => host,
                                        "Port" => port,
                                        "Timeout" => timeout)

      telnet_session.cmd(command) do |data|
        yield data if block_given?
      end

      telnet_session.close
    end
  end
end