require 'pry'
module Direction
  NORTH = 'NORTH'
  SOUTH = 'SOUTH'
  EAST = 'EAST'
  WEST = 'WEST'

  TURN_RIGHT = 1
  TURN_LEFT = -1
  CLOCK_WISE_DIRECTIONS = [NORTH, EAST, SOUTH, WEST]
  MAX_INDEX = CLOCK_WISE_DIRECTIONS.size

  def self.get_direction(cur_direction, turn_left_or_right)
    index = CLOCK_WISE_DIRECTIONS.find_index(cur_direction)
    new_index =  (index + turn_left_or_right) % MAX_INDEX
    return CLOCK_WISE_DIRECTIONS[new_index]
  end

  def self.is_valid?(facing)
    CLOCK_WISE_DIRECTIONS.find_index(facing) != nil
  end
end
