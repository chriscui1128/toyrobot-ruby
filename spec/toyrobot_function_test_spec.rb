require "spec_helper"

RSpec.describe Toyrobot::ToyRobot, 'Function Test of ToyRobot Application' do
  subject { described_class.new }
  
  context 'normal scenarios without invalid commands' do
    it 'scenario 1' do
  	  file_path = File.expand_path("../testdata/scenario1.txt", __FILE__)
  	  output = "The Robot currently at (2, 1) and facing EAST\n"
  	  expect { subject.robot_go(file_path) }.to output(output).to_stdout
    end

    it 'scenario 2' do
  	  file_path = File.expand_path("../testdata/scenario2.txt", __FILE__)
  	  output = "The Robot currently at (4, 4) and facing NORTH\n"
  	  expect { subject.robot_go(file_path) }.to output(output).to_stdout
    end

    it 'scenario 3' do
  	  file_path = File.expand_path("../testdata/scenario3.txt", __FILE__)
  	  output = "The Robot currently at (0, 0) and facing SOUTH\n"
  	  expect { subject.robot_go(file_path) }.to output(output).to_stdout
    end

    it 'scenario 4' do
  	  file_path = File.expand_path("../testdata/scenario4.txt", __FILE__)
  	  output = "The Robot currently at (3, 3) and facing WEST\n"
  	  expect { subject.robot_go(file_path) }.to output(output).to_stdout
    end
  end

  context 'scenarios with invalid commands' do
    it 'scenario 5' do
  	  file_path = File.expand_path("../testdata/scenario5.txt", __FILE__)
  	  output = "place 0, 0, NORTH is an invalid command\n" +
  	           "move is an invalid command\n" +
  	           "left is an invalid command\n" +
  	           "right is an invalid command\n" +
  	           "report is an invalid command\n" +
  	           "COMMAND is an invalid command\n" +
  	           "TURN_LEFT is an invalid command\n" +
  	           "PRINT is an invalid command\n" +
  	           "The Robot currently at (2, 1) and facing EAST\n"
  	  expect { subject.robot_go(file_path) }.to output(output).to_stdout
    end

    it 'scenario 6' do
  	  file_path = File.expand_path("../testdata/scenario6.txt", __FILE__)
  	  output = "THE FILE scenario6.txt IS EMPTY\n"
  	  expect { subject.robot_go(file_path) }.to output(output).to_stdout
    end

    it 'scenario 7' do
  	  file_path = File.expand_path("../testdata/scenario7", __FILE__)
  	  output = "THE FILE scenario7 IS NOT A REGULAR FILE\n"
  	  expect { subject.robot_go(file_path) }.to output(output).to_stdout
    end

    it 'scenario 8' do
  	  file_path = File.expand_path("../testdata/scenario8.txt", __FILE__)
  	  output = "THE FILE scenario8.txt DOES NOT EXIST\n"
  	  expect { subject.robot_go(file_path) }.to output(output).to_stdout
    end
  end
end