module Toyrobot
  class ToyRobot
    attr_reader :robot

    def initialize
      @robot = ToyrobotAPI.new
    end

    def robot_go(file_path)
      if file_path.nil? || file_path.empty?
        run_with_console
      else
        result, output = run_with_file(file_path)
        puts output unless result
      end
    end

    private

    def run_with_console
      loop do
        input = gets.strip
        break if %w[QUIT EXIT].include?(input.upcase)
        if input.empty? then puts "PLEASE INPUT COMMANDS"
        else robot.run(input)
        end
      end
    end

    def run_with_file(file_path)
      return [false, "THE FILE #{File.basename(file_path)} DOES NOT EXIST"] unless File.exist?(file_path)
      return [false, "THE FILE #{File.basename(file_path)} IS NOT A REGULAR FILE"] unless File.file?(file_path)
      return [false, "THE FILE #{File.basename(file_path)} IS EMPTY"] if File.zero?(file_path)
      robot.read_commands(file_path).each do |command|
        robot.run(command)
      end
    end
  end
end
