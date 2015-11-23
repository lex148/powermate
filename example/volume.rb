require 'powermate'


pmate = Powermate::Device.scan.first
pmate.open

sinks = `pactl list sinks | grep "Sink #"`.split("\n")
sinks = sinks.map{|s| s.match(/[0-9]+/).to_s }


pmate.on_clockwise do |e|
  puts "Volume +"
  sinks.each do |s|
    `pactl set-sink-volume #{s} +1%`
  end
end


pmate.on_counter_clockwise do |e|
  puts "Volume -"
  sinks.each do |s|
    `pactl set-sink-volume #{s} -1%`
  end
end


Powermate.wait_for_events
