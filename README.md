# Powermate

powermate is a gem trigger things to happen when your powermate is turned

``` ruby
# do_it.rb
require 'powermate'

pmate = Powermate::Device.scan.first
pmate.open

pmate.on_clockwise do |e|
  puts 'turned clockwise'
end

pmate.on_counter_clockwise do |e|
  puts 'turned counter clockwise'
end

Powermate.wait_for_events
```

Install the gem:

``` shell
gem install powermate
```

And run with:

``` shell
ruby do_it.rb
```

## Events

``` ruby

pmate.on_clockwise do |e|
  .. do something here ..
end

pmate.on_counter_clockwise do |e|
  .. do something here ..
end

pmate.on_rotate do |e|
  .. do something here ..
end

pmate.on_change do |e|
  .. do something here ..
end

```

