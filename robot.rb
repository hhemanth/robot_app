require 'pry'
class Robot
  attr_accessor :name, :table
  attr_accessor :x, :y, :facing

  def initialize(name, table)
    self.name = name
    self.table = table
    self.x = nil
    self.y = nil
    self.facing = nil
  end

  def place(i,j,facing)
    return unless table.am_i_safe?(i.to_i,j.to_i)
    return unless Direction::is_valid?(facing)
    self.x = i.to_i
    self.y = j.to_i
    self.facing = facing
  end

  def move
    return if is_invalid?
    self.send("move_#{facing}".to_sym)
  end

  def report
    return "invalid robot position" if is_invalid?
    return "#{x},#{y},#{facing.upcase}"
  end

  def left
    turn(Direction::TURN_LEFT)
  end
  def right
    turn(Direction::TURN_RIGHT)
  end

  def is_invalid?
    self.x.nil? || self.y.nil? || self.facing.nil?
  end

  private

  def turn(turning)
    return if is_invalid?
    self.facing = Direction::get_direction(self.facing, turning)
  end

  def move_NORTH
    self.y = self.y + 1 if table.am_i_safe?(self.x , self.y+1)
  end

  def move_SOUTH
    self.y = self.y - 1 if table.am_i_safe?(self.x , self.y-1)
  end

  def move_WEST
    self.x = self.x - 1 if table.am_i_safe?(self.x-1 , self.y)
  end

  def move_EAST
    self.x = self.x + 1 if table.am_i_safe?(self.x+1 , self.y)
  end



end
