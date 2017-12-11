module Toyrobot
  class Table
    attr_accessor :blocks

    def initialize(arguments)
      @width = arguments.fetch(:width, 0)
      @length = arguments.fetch(:length, 0)
      @blocks = []
    end

    def valid_position?(x_coordinate, y_coordinate)
      (0...@width).cover?(x_coordinate) &&
        (0...@length).cover?(y_coordinate)
    end
  end
end
