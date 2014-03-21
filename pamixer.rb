require_relative 'PowerMate'

begin
  pmate = PowerMate.new
rescue RuntimeError => e
  $stderr << "Error: " + e.to_s + "\n"
  exit(1)
end


pmate.on_rotate { |event|
  puts event
    #volume = xmms.volume
    #if event.value >0 then      # increase volume
    #  lvol = volume.left + 1
    #  rvol = volume.right + 1
    #else                        # decrease volume
    #  lvol = volume.left - 1
    #  rvol = volume.right - 1
    #end

    #begin
    #  xmms.volume = XMMS::Volume.new(lvol, rvol)  # set volume
    #rescue Errno::ENOENT, Errno::ECONNREFUSED
    #  # don't care if XMMS not runnging, let's hope it runs one day again
    #end
}



# run until interrupted
begin
 Thread.new{ pmate.each_event{} }.join
rescue Interrupt
   exit(0)
end
