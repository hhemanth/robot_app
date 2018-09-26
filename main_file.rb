require_relative './robot'
require_relative './direction'
require_relative './command_executor'
require_relative './robot_command_parser'
require_relative './robot'
require_relative './table'

File.open("cmd_input.txt").each do |command_input|
  rcp = RobotCommandParser.new(command_input, nil)
  commands = rcp.build_list_of_commands
  table = Table.new(5, 5)
  robot = Robot.new("robo", table)
  cmd_executor = CommandExecutor.new(robot, commands)
  p "Input - #{command_input}"
  p cmd_executor.run
end
