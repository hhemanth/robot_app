require_relative '../robot'
require_relative '../direction'

describe Direction do
  it "should get direction when turning right from NORTH" do
    new_direction = Direction::get_direction(Direction::NORTH, Direction::TURN_RIGHT)
    expect(new_direction).to eq(Direction::EAST)
  end

  it "should get direction when turning left from NORTH" do
    new_direction = Direction::get_direction(Direction::NORTH, Direction::TURN_LEFT)
    expect(new_direction).to eq(Direction::WEST)
  end

  it "valid direction" do
    expect(Direction::is_valid?(Direction::NORTH)).to be_truthy
  end

  it "invalid facing direction" do
    expect(Direction::is_valid?("ab")).to be_falsey
  end


end

