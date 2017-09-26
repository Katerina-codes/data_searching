require 'table'
require 'ui'

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
    expect(table.search_type_valid?(1)).to eq(true)
  end

  it "returns false if user enters neither 1, 2 or 3" do
    table = Table.new
    expect(table.search_type_valid?("a")).to eq(false)
  end

  it "returns true if user enters 3" do
    table = Table.new
    expect(table.search_type_valid?(3)).to eq(true)
  end

  it "displays prompt message again if input is invalid" do
    input = StringIO.new("3\n1")
    output = StringIO.new
    table = Table.new
    ui_instance = UI.new(output, input)
    table.get_user_intention(ui_instance)
    expect(output.string).to include("Please enter '1' to search the records and '2' to add a record\n")
  end

  it "displays prompt message until input is valid" do
    input = StringIO.new("a\n2")
    output = StringIO.new
    table = Table.new
    ui_instance = UI.new(output, input)
    expect(table.get_user_intention(ui_instance)).to eq("2")
  end

end
