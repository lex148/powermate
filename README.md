# Powermate

this is a gem to trigger things to happen when you turn your powermate

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

## Setup
Note: you will need to run the setup.sh file or put the file 60-powermate.rules in
/etc/udev/rules.d/
after that you need to make sure you are a member of the group 'powermate' so
you can access the device


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

