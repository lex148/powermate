require 'fiber'

class Powermate::Device

  attr_reader :file

  def initialize path
    @file = File.open path, File::Constants::RDONLY
    @reader = nil
    @workers =[]
    #open
  end

  def self.find
    root = "/dev/input/by-id"
    file = Dir.foreach(root).select{|f| f =~ /PowerMate/i}.first
    return nil unless file
    new(root + "\/" + file)
  end

  def on_change &block
    @workers.push block
  end

  def open
    return if @reader
    @reader = Fiber.new{
      @file.readbyte()      #throw out the byte line of junk
      while @reader do
        data = @device.read( 16 )
        event = Powermate::Event.new(data.bytes)
        @workers.each{|w| w.call(event) }
      end
    }
  end





end
