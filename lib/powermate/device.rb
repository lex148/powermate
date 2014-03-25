require 'json'

class Powermate::Device

  #attr_reader :file
  #SIZE = 24
  SIZE = 48

  def initialize path
    @file = File.open path, File::Constants::RDONLY
    @reader = nil
    @on_change_blocks =[]
    @on_rotate_blocks=[]
    @on_clockwise_blocks=[]
    @on_counter_clockwise_blocks=[]
    @pressed = false
  end

  def self.scan
    root = "/dev/input/by-id"
    files = Dir.foreach(root).select{|f| f =~ /PowerMate/i}
    files.map{|f| new(root + "\/" + f)}
  end

  def on_change &block
    @on_change_blocks.push block
    self
  end

  def on_rotate &block
    @on_rotate_blocks.push block
    self
  end

  def on_clockwise &block
    @on_clockwise_blocks.push block
    self
  end

  def on_counter_clockwise &block
    @on_counter_clockwise_blocks.push block
    self
  end


  def open
    return if @reader
    @reader = Thread.new{
      #trash any old events
      #@file.readbyte()      #throw out the first byte, its junk
      bytes =[]
      while @reader do

        bytes << @file.readbyte()

        if bytes.size == SIZE
          event = Powermate::Event.new(bytes, @pressed)
          bytes = []
          @pressed = event.pressed
          @on_change_blocks.each{|w| w.call(event) }
          @on_rotate_blocks.each{|w| w.call(event) } if event.clockwise || event.counter_clockwise
          @on_clockwise_blocks.each{|w| w.call(event) } if event.clockwise
          @on_counter_clockwise_blocks.each{|w| w.call(event) } if event.counter_clockwise

        end

      end
    }
    !!@reader
  end

  def close
    @reader = nil
    !@reader
  end





end
