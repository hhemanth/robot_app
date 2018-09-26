class RobotCommand
  attr_accessor :action, :params

  def initialize(action, params)
    self.action = action
    self.params = params
  end

  def to_s
    return self.action if self.params.nil?
    return "#{self.action} - #{self.params}"
  end
end
