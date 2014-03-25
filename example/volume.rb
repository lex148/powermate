require 'powermate'

#gem install pulseaudio
require 'pulseaudio'


pmate = Powermate::Device.scan.first
pmate.open


pmate.on_clockwise do |e|
  sinks = PulseAudio::Sink.list
  sinks.each do |sink|
    sink.vol_incr if sink.active?
  end
end


pmate.on_counter_clockwise do |e|
  sinks = PulseAudio::Sink.list
  sinks.each do |sink|
    sink.vol_decr if sink.active?
  end
end


Powermate.wait_for_events
