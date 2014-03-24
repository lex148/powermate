require 'rubygems'

require 'powermate/version'
require 'powermate/event'
require 'powermate/device'

module Powermate

  module Wait
    def wait_for_events
      begin
       sleep 1 while(true)
      rescue Interrupt
       exit(0)
      end
    end
  end

  #put the methods in wait directly on Powermate
  extend Powermate::Wait

end


