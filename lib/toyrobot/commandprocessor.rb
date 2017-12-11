module Toyrobot
  class CommandProcessor
    attr_reader :robot, :table

    def initialize(arguments)
      @table = arguments.fetch(:table, nil)
    end

    def place(x_coordinate, y_coordinate, direction)
      return unless Robot::DIRECTIONS.include?(direction)
      return unless @table.valid_position?(x_coordinate, y_coordinate)
      @robot = Robot.new(x_coordinate: x_coordinate, y_coordinate: y_coordinate, direction: direction)
    end

    def move
      return unless on_the_table?
      robot.move if @table.valid_position?(*robot.next_position)
    end

    def left
      # return unless on_the_table?
      robot.turn_left if on_the_table?
    end

    def right
      # return unless on_the_table?
      robot.turn_right if on_the_table?
    end

    def report
      return unless on_the_table?
      position = robot.report
      puts "The Robot currently at (" \
           "#{position[:x_coordinate]}, " \
           "#{position[:y_coordinate]}) " \
           "and facing #{position[:direction]}"
    end

    def on_the_table?
      !robot.nil?
    end

    def invalid(command)
      puts command.concat(" is an invalid command")
    end

    def block(x_coordinate, y_coordinate)
    	@table.blocks << [x_coordinate,y_coordinate]
    end
  end
end
