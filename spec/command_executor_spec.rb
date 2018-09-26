require_relative '../robot'
require_relative '../direction'
require_relative '../command_executor'
require_relative '../robot_command_parser'
require_relative '../robot'
require_relative '../table'
require 'pry'
#integration tests
describe CommandExecutor do
  it "should parse the command and execute cmd1" do
    command_input = "PLACE 0,0,NORTH LEFT REPORT"
    rcp = RobotCommandParser.new(command_input,nil)
    commands = rcp.build_list_of_commands
    table = Table.new(5,5)
    robot = Robot.new("robo", table)
    cmd_executor = CommandExecutor.new(robot, commands)
    expect(cmd_executor.run).to eq("0,0,WEST")
  end

  it "should parse the command and execute cmd1" do
    command_input = "PLACE 1,2,EAST MOVE MOVE LEFT MOVE REPORT"
    rcp = RobotCommandParser.new(command_input,nil)
    commands = rcp.build_list_of_commands
    table = Table.new(5,5)
    robot = Robot.new("robo", table)
    cmd_executor = CommandExecutor.new(robot, commands)
    expect(cmd_executor.run).to eq("3,3,NORTH")
  end

  it "should parse the command and execute cmd1, should not fall off" do
    command_input = "PLACE 1,2,EAST MOVE MOVE MOVE MOVE MOVE MOVE MOVE REPORT"
    rcp = RobotCommandParser.new(command_input,nil)
    commands = rcp.build_list_of_commands
    table = Table.new(5,5)
    robot = Robot.new("robo", table)
    cmd_executor = CommandExecutor.new(robot, commands)
    expect(cmd_executor.run).to eq("4,2,EAST")
  end


end

