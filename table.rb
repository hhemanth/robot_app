class Table
  attr_accessor :length, :breadth

  def initialize(length, breadth)
    self.length = length
    self.breadth = breadth
  end

  def am_i_safe?(x, y)
    return within_bounds?(x, length) && within_bounds?(y, breadth)
  end


  def is_valid?
    return length > 0 && breadth > 0
  end

  def to_s
    return "Table of Size #{length} X #{breadth}" if is_valid?
    return "Table of Size Invalid"
  end

  private

  def within_bounds?(i, bound)
    return (i >= 0 && i < bound)
  end

end
