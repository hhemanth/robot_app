require_relative '../robot'
require_relative '../direction'
require_relative '../table'

describe Robot do
  let(:table) {Table.new(5, 5)}
  let(:robot) {Robot.new("robo", Table.new(5, 5))}

  context "Place Robot on Table" do

    it "place robot in position 0,0,NORTH" do
      robot.place(0,0, Direction::NORTH)
      expect(robot.report).to eq("0,0,NORTH")
    end

    it "place robot in position 4,4,NORTH" do
      robot.place(4,4, Direction::NORTH)
      expect(robot.report).to eq("4,4,NORTH")
    end

    it "place robot in position -1,-1,NORTH, should ignore the command"do
      robot.place(0,0, Direction::NORTH)
      robot.place(-1,-1, Direction::NORTH)
      expect(robot.report).to eq("0,0,NORTH")
    end

  end

  context "Turn Robot" do
     it "turn robot right from NORTH direction" do
       robot.place(0,0, Direction::NORTH)
       expect(robot.report).to eq("0,0,NORTH")
       robot.right
       expect(robot.report).to eq("0,0,EAST")
     end

    it "turn robot left from WEST direction" do
      robot.place(0,0, Direction::WEST)
      expect(robot.report).to eq("0,0,WEST")
      robot.left
      expect(robot.report).to eq("0,0,SOUTH")
    end
  end

  context "Move Robot" do
    it "move robot from position 0,0,N" do
      robot.place(0,0, Direction::NORTH)
      robot.move
      expect(robot.report).to eq("0,1,NORTH")
    end

    it "move robot from position 0,0,E" do
      robot.place(0,0, Direction::EAST)
      robot.move
      expect(robot.report).to eq("1,0,EAST")
    end

    it "move robot from position 0,0,S should not fall off" do
      robot.place(0,0, Direction::SOUTH)
      robot.move
      expect(robot.report).to eq("0,0,SOUTH")
    end

    it "move robot from position 4,4,N should not fall off" do
      robot.place(4,4, Direction::NORTH)
      robot.move
      expect(robot.report).to eq("4,4,NORTH")
    end

  end

end

