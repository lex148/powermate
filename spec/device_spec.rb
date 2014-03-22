require 'helper'

describe Powermate do

  #before do
  #  @subject = Powermate.find
  #end

  it 'should respond to find' do
    Powermate::Device.must_respond_to :find
  end

  it 'should find a powermate device' do
    pmate = Powermate::Device.find
    pmate.must_be_instance_of Powermate::Device
  end


end
