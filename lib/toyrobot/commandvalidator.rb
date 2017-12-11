require "English"

module Toyrobot
  class CommandValidator
    def self.validate(command)
      case command
      when /\APLACE (?<x>\d+),(?<y>\d+),(?<f>\w+)\Z/ then [:place, $LAST_MATCH_INFO[:x].to_i, $LAST_MATCH_INFO[:y].to_i, $LAST_MATCH_INFO[:f]]
      when /\AMOVE\Z/ then [:move]
      when /\ALEFT\Z/ then [:left]
      when /\ARIGHT\Z/ then [:right]
      when /\AREPORT\Z/ then [:report]
      else [:invalid, command]
      end
    end
  end
end
