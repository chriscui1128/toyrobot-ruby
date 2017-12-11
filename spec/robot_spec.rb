require "spec_helper"

RSpec.describe Toyrobot::Robot, "Robot Test" do
  subject { Toyrobot::Robot.new() }
  
  it "move to north with 1 step" do
  	subject.move_north
    expect(subject.y_coordinate).to eq(1)
  end

  it "move to north with 5 step" do
  	5.times {subject.move_north}
    expect(subject.y_coordinate).to eq(5)
  end

  it "move to south with 1 step" do
  	subject.move_south
    expect(subject.y_coordinate).to eq(-1)
  end

  it "move to south with 5 step" do
   	5.times { subject.move_south }
    expect(subject.y_coordinate).to eq(-5)
  end

  it "move to west with 1 step" do
  	subject.move_west
    expect(subject.x_coordinate).to eq(-1)
  end

  it "move to west with 5 step" do
   	5.times { subject.move_west }
    expect(subject.x_coordinate).to eq(-5)
  end

  it "move to east with 1 step" do
  	subject.move_east
  	expect(subject.x_coordinate).to eq(1)
  end

  it "move to east with 5 step" do
  	5.times { subject.move_east }
  	expect(subject.x_coordinate).to eq(5)
  end

  context "when face to the north" do
    subject { described_class.new(direction: 'NORTH') }

    it "move towards north" do
      subject.move
      expect(subject.x_coordinate).to eq(0)
      expect(subject.y_coordinate).to eq(1)
      expect(subject.direction).to eq('NORTH')
    end

    it "turn left from north to west" do
      subject.turn_left
      expect(subject.x_coordinate).to eq(0)
      expect(subject.y_coordinate).to eq(0)
      expect(subject.direction).to eq('WEST')
    end

    it "turn right from north to east" do
      subject.turn_right
      expect(subject.x_coordinate).to eq(0)
      expect(subject.y_coordinate).to eq(0)
      expect(subject.direction).to eq('EAST')
    end
  end

  context "when face to the south" do
  	subject { described_class.new(direction: 'SOUTH') }

  	it "move towards south" do
      subject.move
      expect(subject.x_coordinate).to eq(0)
      expect(subject.y_coordinate).to eq(-1)
      expect(subject.direction).to eq('SOUTH')
  	end

    it "turn left from south to east" do
      subject.turn_left
      expect(subject.x_coordinate).to eq(0)
      expect(subject.y_coordinate).to eq(0)
      expect(subject.direction).to eq('EAST')
    end

    it "turn right from south to west" do
      subject.turn_right
      expect(subject.x_coordinate).to eq(0)
      expect(subject.y_coordinate).to eq(0)
      expect(subject.direction).to eq('WEST')
    end
  end

  context "when face to the west" do
  	subject { described_class.new(direction: 'WEST') }

  	it "move towards west" do
      subject.move
      expect(subject.x_coordinate).to eq(-1)
      expect(subject.y_coordinate).to eq(0)
      expect(subject.direction).to eq('WEST')
  	end

    it "turn left from west to south" do
      subject.turn_left
      expect(subject.x_coordinate).to eq(0)
      expect(subject.y_coordinate).to eq(0)
      expect(subject.direction).to eq('SOUTH')
    end

    it "turn right from west to north" do
      subject.turn_right
      expect(subject.x_coordinate).to eq(0)
      expect(subject.y_coordinate).to eq(0)
      expect(subject.direction).to eq('NORTH')
    end
  end

  context "when face to the east" do
  	subject { described_class.new(direction: 'EAST') }

  	it "move towards east" do
      subject.move
      expect(subject.x_coordinate).to eq(1)
      expect(subject.y_coordinate).to eq(0)
      expect(subject.direction).to eq('EAST')
  	end

    it "turn left from east to north" do
      subject.turn_left
      expect(subject.x_coordinate).to eq(0)
      expect(subject.y_coordinate).to eq(0)
      expect(subject.direction).to eq('NORTH')
    end

    it "turn right from east to south" do
      subject.turn_right
      expect(subject.x_coordinate).to eq(0)
      expect(subject.y_coordinate).to eq(0)
      expect(subject.direction).to eq('SOUTH')
    end
  end

  context "should report position" do
    subject { described_class.new(
      x_coordinate: 4, 
      y_coordinate: 1,
      direction: 'NORTH') }

    it "report position" do
      expect(subject.report).to eq({
        x_coordinate: 4,
        y_coordinate: 1,
        direction: 'NORTH'
        })
    end
  end

  context "get next position when move to north" do
    subject { described_class.new(direction: 'NORTH') }

    it "should be [0, 1]" do
      subject.next_position
      expect(subject.next_position).to eq([0, 1])
    end
  end

  context "get next position when move to south" do
    subject { described_class.new(direction: 'SOUTH') }

    it "should be [0, -1]" do
      subject.next_position
      expect(subject.next_position).to eq([0, -1])
    end
  end

  context "get next position when move to west" do
    subject { described_class.new(direction: 'WEST') }

    it "should be [-1, 0]" do
      subject.next_position
      expect(subject.next_position).to eq([-1, 0])
    end
  end

  context "get next position when move to east" do
    subject { described_class.new(direction: 'EAST') }

    it "should be [1, 0]" do
      subject.next_position
      expect(subject.next_position).to eq([1, 0])
    end
  end
end
