module Toyrobot
  class ToyrobotAPI
    attr_reader :processor

    def initialize
      table = Table.new(width: 5, length: 5)
      @processor = CommandProcessor.new(table: table)
    end

    def read_commands(filepath)
      File.readlines(filepath).collect { |line| line.strip }
      File.readlines(filepath).map(&:strip)
      # commands = []
      # File.readlines(filepath).each do |line|
      #   commands << line.strip
      # end
      # commands
    end

    def run(command)
      prefix, *args = CommandValidator.validate(command)
      processor.send(prefix, *args)
    end
  end
end
