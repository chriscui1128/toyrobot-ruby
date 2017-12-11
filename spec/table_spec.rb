require "spec_helper"

RSpec.describe Toyrobot::Table, 'Table Test' do
  subject { described_class.new(width: 5, length: 5) }

  context 'should be a valid postion' do
  	it { should be_valid_position(0, 0) }
  	it { should be_valid_position(0, 1) }
  	it { should be_valid_position(0, 2) }
  	it { should be_valid_position(0, 3) }
  	it { should be_valid_position(0, 4) }
  	it { should be_valid_position(1, 0) }
  	it { should be_valid_position(1, 1) }
  	it { should be_valid_position(1, 2) }
  	it { should be_valid_position(1, 3) }
  	it { should be_valid_position(1, 4) }
  	it { should be_valid_position(2, 0) }
  	it { should be_valid_position(2, 1) }
  	it { should be_valid_position(2, 2) }
  	it { should be_valid_position(2, 3) }
  	it { should be_valid_position(2, 4) }
  	it { should be_valid_position(3, 0) }
  	it { should be_valid_position(3, 1) }
  	it { should be_valid_position(3, 2) }
  	it { should be_valid_position(3, 3) }
  	it { should be_valid_position(3, 4) }
  	it { should be_valid_position(4, 0) }
  	it { should be_valid_position(4, 1) }
  	it { should be_valid_position(4, 2) }
  	it { should be_valid_position(4, 3) }
  	it { should be_valid_position(4, 4) }
  end

  context 'should not be a valid postion' do
  	it { should_not be_valid_position(5, 5) }
  	it { should_not be_valid_position(0, 5) }
  	it { should_not be_valid_position(5, 0) }
  	it { should_not be_valid_position(-1, 0) }
  	it { should_not be_valid_position(0, -1) }
  end
end