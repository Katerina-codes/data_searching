require 'table'

RSpec.describe Table do

  it "returns false if user enters 0" do
    table = Table.new
    expect(table.is_input_valid?(0)).to eq(false)
  end

end
