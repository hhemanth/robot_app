require 'pry'

class CommandExecutor
  attr_accessor :subject, :commands

  def initialize(subject, commands)
    self.subject = subject
    self.commands = commands
  end

  def run
    op = nil
    self.commands.each do |command|
      cmd_action = command.action.downcase.to_sym
      "Invalid command - #{command.to_s}" unless subject.respond_to?(cmd_action)
      op = subject.send(cmd_action) if command.params.nil?
      op = subject.send(cmd_action, *command.params) if command.params && command.params.size > 0
    end
    return op
  end

end
