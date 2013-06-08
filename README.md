# Sidekiq::RedisLog [![Build Status](https://secure.travis-ci.org/rpocklin/sidekiq-redislog.png)](http://travis-ci
.org/rpocklin/sidekiq-redislog)

Displays a monitor window which echos the telnet status log of redis for sidekiq.  Autoscrolls.

## Installation

NOTE: Doesn't work with Webrick because it uses SSE (server-sent events) and Webrick is single-threaded.
Works with Phusion Passenger / Thin / Puma / Rainbows and probably Unicorn.

Add this line to your application's Gemfile:

```ruby
gem 'sidekiq-redislog'
```

Start up your rails stack
Navigate to '/sidekiq' (or your custom remapped route)
Click 'redis' tab
You will see activity (at the very least 'OK')
  you can create activity by opening the other Sidekiq tabs (Dashboard/Workers/etc) in new windows.

## Dependencies

Depends on Sidekiq >= 2.2.1

## Usage and Modes

When you run your app you will now see an additional tab 'Redis' in the sidekiq web console.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Released under the MIT License. See the [LICENSE][license] file for further details.

[license]: https://github.com/rpocklin/sidekiq-redislog/blob/master/LICENSE


## TODO

Get access to the redis URL sidekiq connects with to use for telnet parameters.
XHR polling (< IE8 etc.)
Connect/Disconnet buttons since it consumes a thread for the poller.


## Notes

If you mount sidekiq to a non-standard route ie. mount Sidekiq::Web => '/admin/sidekiq' then you'll have to
redirect the stream url (which javascript hits via SSE):
  ```match '/sidekiq/redis_log_stream' => redirect('/admin/sidekiq/redis_log_stream')```

