module Toyrobot
  class Robot
    attr_reader :x_coordinate, :y_coordinate, :direction
    DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze

    def initialize(arguments)
      @x_coordinate = arguments.fetch(:x_coordinate, 0)
      @y_coordinate = arguments.fetch(:y_coordinate, 0)
      @direction = arguments.fetch(:direction, 'NORTH')
    end

    def x_coordinate
      @x_coordinate
    end

    def move_north
      @y_coordinate += 1
    end

    def move_south
      @y_coordinate -=1
    end

    def move_west
      @x_coordinate -= 1
    end

    def move_east
      @x_coordinate += 1
    end

    def move
      send("move_#{direction.downcase}")
      # case direction
      # when 'NORTH' then move_north
      # when 'SOUTH' then move_south
      # when 'WEST'  then move_west
      # when 'EAST'  then move_east
      # end
    end

    def turn_left
      turn(-1)
    end

    def turn_right
      turn(1)
    end

    def report
      {
        x_coordinate: x_coordinate,
        y_coordinate: y_coordinate,
        direction: direction
      }
    end

    def next_position
      case direction
      when 'NORTH' then [x_coordinate, y_coordinate + 1]
      when 'SOUTH' then [x_coordinate, y_coordinate - 1]
      when 'WEST'  then [x_coordinate - 1, y_coordinate]
      when 'EAST'  then [x_coordinate + 1, y_coordinate]
      end
    end

    private

    def turn(rotate_direction)
      direction_index = DIRECTIONS.index(direction)
      @direction = DIRECTIONS.rotate(rotate_direction).at(direction_index)
    end
  end
end
