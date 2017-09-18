require 'table'

RSpec.describe Table do

  it "returns false if user enters 0" do
    table = Table.new
    expect(table.is_input_valid?(0)).to eq(false)
  end

  it "returns true if user enters 'a' " do
    table = Table.new
    expect(table.is_input_valid?("a")).to eq(true)
  end

  it "returns false if user enters '!' " do
    table = Table.new
    expect(table.is_input_valid?("!")).to eq(false)
  end

 it "returns true if user enters multiple letters 'jac' " do
    table = Table.new
    expect(table.is_input_valid?("jac")).to eq(true)
  end

  it "returns true if user enters 1" do
    table = Table.new
    expect(table.search_type_valid?("1")).to eq(true)
  end

end
