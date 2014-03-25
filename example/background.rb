require 'powermate'

pmate = Powermate::Device.scan.first
pmate.open

files = Dir["/home/lex/Documents/backgrounds/*"].select{ |x| x =~ /(png|jpg|jpeg)$/}
files = files.shuffle


pmate.on_clockwise do |e|
  files.rotate!(1)
  puts files.first
  `feh --bg-scale #{files.first}`
end


pmate.on_counter_clockwise do |e|
  files.rotate!(-1)
  puts files.first
  `feh --bg-scale #{files.first}`
end


Powermate.wait_for_events
