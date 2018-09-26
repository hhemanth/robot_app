require_relative '../table'

describe Table do
  it "should report correct table size" do
    table = Table.new(5, 5)
    expect(table.to_s).to eq("Table of Size 5 X 5")
  end

  it "should return invalid table size" do
    table = Table.new(0, 0)
    expect(table.to_s).to eq("Table of Size Invalid")
  end

  context "Will I fall or not" do
    let(:table) {Table.new(5, 5)}

    it "should not fall off at position 2,3" do
      expect(table.am_i_safe?(2, 3)).to eq(true)
    end

    it "should not fall off at position 0,0" do
      expect(table.am_i_safe?(2, 3)).to eq(true)
    end

    it "should not fall off at position 4,4" do
      expect(table.am_i_safe?(2, 3)).to eq(true)
    end

    it "should fall off at position -1,-1" do
      expect(table.am_i_safe?(-1, -1)).to eq(false)
    end

    it "should fall off at position 5,5" do
      expect(table.am_i_safe?(5, 5)).to eq(false)
    end
  end
end

