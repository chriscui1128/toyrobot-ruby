require 'bundler/setup'
require 'toyrobot'

toyrobot = Toyrobot::ToyRobot.new
toyrobot.robot_go(ARGV[0])
