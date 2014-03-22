class Powermate::Event

  attr_reader :clockwise, :counter_clockwise, :pressed

  def initialize raw_event
    @clockwise = false
    @counter_clockwise = false
    @pressed = false
  end

end
