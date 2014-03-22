class Powermate::Device

  attr_reader :file

  def initialize path
    @file = path
  end

  def self.find
    file = Dir.foreach("/dev/input/by-id").select{|f| f =~ /PowerMate/i}.first
    return nil unless file
    new(file)
  end



end
