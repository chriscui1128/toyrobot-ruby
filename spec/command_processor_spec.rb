require "spec_helper"

RSpec.describe Toyrobot::CommandProcessor, 'Command Processor Test' do
  let(:table) { Toyrobot::Table.new(width: 5, length: 5) }
  subject { described_class.new(table: table) }

  context 'place test' do
  	it 'should place robot on the table if in a valid position' do
  	  subject.place(4, 3, 'WEST')
  	  expect(subject.robot).not_to be_nil
  	  expect(subject.robot.report).to eq(
          x_coordinate: 4,
          y_coordinate: 3,
          direction: 'WEST'
          )
    end

    it 'should not place robot on the table if not a valid position' do
  	  subject.place(5, 5, 'EAST')
  	  expect(subject.robot).to be_nil
    end

    it 'should not place robot on the table if not a valid direction' do
      subject.place(2, 3, 'XYZ')
      expect(subject.robot).to be_nil
    end
  end

  context 'move test' do
    context 'can move within the table when face to north' do
  	  before do
  	    subject.place(0, 3, 'NORTH')
  	  end

  	  it 'can move if it will not out of boundary' do
  	    expect(subject.robot).to receive(:move)
  	    subject.move
  	  end
    end

    context 'can move within the table when face to south' do
  	  before do
  	    subject.place(0, 1, 'SOUTH')
  	  end

  	  it 'can move if it will not out of boundary' do
  	    expect(subject.robot).to receive(:move)
  	    subject.move
  	  end
    end

    context 'can move within the table when face to west' do
  	  before do
  	    subject.place(1, 0, 'WEST')
  	  end

  	  it 'can move if it will not out of boundary' do
  	    expect(subject.robot).to receive(:move)
  	    subject.move
  	  end
    end

    context 'can move within the table when face to east' do
  	  before do
  	    subject.place(3, 0, 'EAST')
  	  end

  	  it 'can move if it will not out of boundary' do
  	    expect(subject.robot).to receive(:move)
  	    subject.move
  	  end
    end

    context 'can not move out of the table when face norht' do
  	  before do
  	    subject.place(0, 4, 'NORTH')
  	  end

  	  it 'should not move if it will get out of boundary' do
  	    expect(subject.robot).not_to receive(:move)
  	    subject.move
  	  end
    end

    context 'can not move out of the table when face to south' do
  	  before do
  	    subject.place(0, 0, 'SOUTH')
  	  end

  	  it 'should not move if it will get out of boundary' do
  	    expect(subject.robot).not_to receive(:move)
  	    subject.move
  	  end
    end

    context 'can not move out of the table when face to west' do
  	  before do
  	    subject.place(0, 0, 'WEST')
  	  end

  	  it 'should not move if it will get out of boundary' do
  	    expect(subject.robot).not_to receive(:move)
  	    subject.move
  	  end
    end

    context 'can not move out of the table when face to east' do
  	  before do
  	    subject.place(4, 4, 'EAST')
  	  end

  	  it 'should not move if it will get out of boundary' do
  	    expect(subject.robot).not_to receive(:move)
  	    subject.move
  	  end
    end
  end

  context 'turning test' do
  	let(:robot) { double(Toyrobot::Robot) }
  	before { allow(subject).to receive(:robot).and_return(robot) }

  	it 'tell robot to turn left' do
  	  expect(robot).to receive(:turn_left)
  	  subject.left
  	end

  	it 'tell robot to turn right' do
  	  expect(robot).to receive(:turn_right)
  	  subject.right
  	end
  end

  context 'report test' do
    let(:robot) { Toyrobot::Robot.new(x_coordinate: 2, y_coordinate: 3, direction: 'EAST') }
    before { allow(subject).to receive(:robot).and_return(robot) }

    it 'should call robot report method' do
      stub(robot).to receive(:report) { {x_coordinate: 2, y_coordinate: 3, direction: 'EAST'} }
      message = "The Robot currently at (2, 3) and facing EAST\n"
      expect { subject.report }.to output(message).to_stdout
    end
  end

  context 'robot not on the table should ignore commands' do
    it { should_not be_on_the_table }

    it 'should ignore move' do
      expect { subject.move }.to_not raise_error
    end

    it 'should ignore left' do
      expect { subject.left }.to_not raise_error
    end

    it 'should ignore right' do
      expect { subject.right }.to_not raise_error
    end

    it 'should ignore report' do
      expect { subject.report }.to_not raise_error
    end
  end

  context 'put block on the table' do
    it 'should block' do
      subject.block(4,4)
      expect(subject.table.blocks).to eq([[4,4]])
    end 
  end
end