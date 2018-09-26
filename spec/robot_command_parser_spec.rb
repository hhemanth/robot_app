require_relative '../robot'
require_relative '../direction'
require_relative '../robot_command_parser'
require 'pry'

describe RobotCommandParser do
  it "Should parse the following command1" do
    command_input = "PLACE 0,0,NORTH LEFT REPORT"
    rcp = RobotCommandParser.new(command_input, nil)
    rcp.build_list_of_commands
    expect(rcp.to_s).to eq("PLACE - [\"0\", \"0\", \"NORTH\"] LEFT REPORT")

  end

  it "Should parse the following command2" do
    command_input = "PLACE 1,2,EAST MOVE MOVE LEFT MOVE REPORT"
    rcp = RobotCommandParser.new(command_input, nil)
    rcp.build_list_of_commands
    expect(rcp.to_s).to eq("PLACE - [\"1\", \"2\", \"EAST\"] MOVE MOVE LEFT MOVE REPORT")
  end

  it "Should parse the following, ignore invalid command" do
    command_input = "PLACE 1,2,EAST MOVE MOVE LEFT MOV REPORT"
    rcp = RobotCommandParser.new(command_input, nil)
    rcp.build_list_of_commands
    expect(rcp.to_s).to eq("PLACE - [\"1\", \"2\", \"EAST\"] MOVE MOVE LEFT REPORT")
  end



end

