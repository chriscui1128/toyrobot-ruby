require "spec_helper"

RSpec.describe Toyrobot::ToyrobotAPI, 'Application Interface Test' do
  subject { described_class.new }

  context 'read commands' do
  	it 'read commands from file' do
  	  file_path = File.expand_path("../testdata/commands.txt", __FILE__)
  	  commands = subject.read_commands(file_path)
  	  expect(commands).to eq([
  	  	"PLACE 0,0,NORTH",
  	  	"MOVE",
  	  	"RIGHT",
  	  	"MOVE",
  	  	"LEFT",
  	  	"REPORT"
  	  	])
  	end
  end

  context 'call each command method' do
    let(:processor) { instance_double(Toyrobot::CommandProcessor) }
    before { allow(subject).to receive(:processor).and_return(processor)}

    it 'should invoke place method with arguments in command processor' do
      expect(processor).to receive(:place).with(0,0,"NORTH")
      subject.run("PLACE 0,0,NORTH")
    end

    it 'should invoke move method' do
      expect(processor).to receive(:move)
      subject.run("MOVE")
    end

    it 'should invoke left method' do
      expect(processor).to receive(:left)
      subject.run("LEFT")
    end

    it 'should invoke right method' do
      expect(processor).to receive(:right)
      subject.run("RIGHT")
    end

    it 'should invoke report method' do
      expect(processor).to receive(:report)
      subject.run("REPORT")
    end
  end

  context 'invalid command output' do
    it 'invalid commands alert' do
      message = "PLACE 1, 2, EAST is an invalid command\n"
      expect { subject.run("PLACE 1, 2, EAST") }.to output(message).to_stdout
    end
  end
end