require "spec_helper"

RSpec.describe Toyrobot::CommandValidator, 'Validate Command' do
  context 'valid commands' do
  	it 'PLACE 0,0,NORTH is valid' do
  	  command, *args = described_class.validate("PLACE 0,0,NORTH")
  	  expect(command).to eq(:place)
  	  expect(args).to eq([0, 0, "NORTH"])
  	end

  	it 'PLACE 5,5,XYZ is valid' do
  	  command, *args = described_class.validate("PLACE 5,5,XYZ")
  	  expect(command).to eq(:place)
  	  expect(args).to eq([5, 5, "XYZ"])
  	end

  	it 'MOVE is valid' do
  	  command, *args = described_class.validate("MOVE")
  	  expect(command).to eq(:move)
  	  expect(args).to be_empty
  	end

  	it 'LEFT is valid' do
  	  command, *args = described_class.validate("LEFT")
  	  expect(command).to eq(:left)
  	  expect(args).to be_empty
  	end

  	it 'RIGHT is valid' do
  	  command, *args = described_class.validate("RIGHT")
  	  expect(command).to eq(:right)
  	  expect(args).to be_empty
  	end

   	it 'REPORT is valid' do
  	  command, *args = described_class.validate("REPORT")
  	  expect(command).to eq(:report)
  	  expect(args).to be_empty
  	end
  end

  context 'invalid commands' do
  	it 'place 0,0,NORTH is invalid' do
  	  command, *args = described_class.validate("place 0,0,NORTH")
  	  expect(command).to eq(:invalid)
  	  expect(args).to eq(["place 0,0,NORTH"])
  	end

  	it 'PLACE x,y,f is invalid' do
  	  command, *args = described_class.validate("PLACE x,y,f")
  	  expect(command).to eq(:invalid)
  	  expect(args).to eq(["PLACE x,y,f"])
  	end

    it 'move is invalid' do
  	  command, *args = described_class.validate("move")
  	  expect(command).to eq(:invalid)
  	  expect(args).to eq(["move"])
    end

    it 'left is invalid' do
  	  command, *args = described_class.validate("left")
  	  expect(command).to eq(:invalid)
  	  expect(args).to eq(["left"])
    end

    it 'right is invalid' do
  	  command, *args = described_class.validate("right")
  	  expect(command).to eq(:invalid)
  	  expect(args).to eq(["right"])
    end

    it 'report is invalid' do
  	  command, *args = described_class.validate("report")
  	  expect(command).to eq(:invalid)
  	  expect(args).to eq(["report"])
    end
  end
end