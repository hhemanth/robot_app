require_relative './robot_command'
require_relative './valid_commands'

class RobotCommandParser
  attr_accessor :command_input, :valid_cmd_hash, :valid_cmd, :tokens, :list_of_commands

  def initialize(command_input, valid_cmd_hash)
    self.command_input = command_input
    self.tokens = command_input.split
    self.list_of_commands = []
  end

  def build_list_of_commands
    while(@tokens.size > 0)
      t = @tokens.shift
      c = nil
      c = RobotCommand.new(t,nil) if ValidCommands::CMD_WITHOUT_PARAMS.include?(t && t.upcase)
      c = RobotCommand.new(t, @tokens.shift.split(',')) if ValidCommands::CMD_WITH_PARAMS.include?(t && t.upcase)
      list_of_commands << c unless c.nil?
    end
    return list_of_commands
  end

  def to_s
    str = []
    list_of_commands.each{|c| str << c.to_s} unless list_of_commands.empty?
    return str.join(' ')
  end
end

