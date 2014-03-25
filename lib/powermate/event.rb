require 'pry'

class Powermate::Event

  attr_reader :clockwise, :counter_clockwise, :pressed

  def initialize raw_event, old_pressed
    @clockwise = false
    @counter_clockwise = false
    @pressed = old_pressed

    type = raw_event[16] == 1 ? :push : :rotate
    value = raw_event[20] == 1

    if type == :push
      @pressed = value
    elsif type == :rotate
      @clockwise = value
      @counter_clockwise = !value
    end

  end

  def to_hash
    {
      clockwise: @clockwise,
      counter_clockwise: @counter_clockwise,
      pressed: @pressed
    }
  end


end
