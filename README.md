# Sidekiq::RedisLog [![Build Status](https://secure.travis-ci.org/rpocklin/sidekiq-redislog.png)](http://travis-ci.org/rpocklin/sidekiq-redislog)

Displays a monitor window which echos the telnet status log of redis for sidekiq.  Autoscrolls.

## Installation

NOTE: Doesn't work with Webrick because it uses SSE (server-sent events) and Webrick is single-threaded.
Works with Phusion Passenger / Thin / Puma / Rainbows and probably Unicorn.

Add this line to your application's Gemfile:

```ruby
gem 'sidekiq-redislog'
```

1. Start up your rails stack
2. Navigate to '/sidekiq' (or your custom remapped route)
3. Click 'redis' tab
4. You will see activity (at the very least 'OK' should appear in the text area.)

## Dependencies

Depends on Sidekiq >= 2.2.1

## Usage and Modes

- When you run your app you will now see an additional tab 'Redis' in the sidekiq web console.
- You can create activity by opening the other Sidekiq tabs (Dashboard/Workers/etc) in new browser tabs.

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

- Connect/Disconnect buttons since it consumes a thread for the poller.


## Notes

If you mount sidekiq to a non-standard route ie. mount Sidekiq::Web => '/admin/sidekiq' it will automatically
handle remapping of the stream URI.

