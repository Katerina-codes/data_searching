require 'data_searcher'

RSpec.describe DataSearcher do

  let(:output) { StringIO.new }

  it 'gets input from the user' do
    input = StringIO.new("Z")
    data_searcher = DataSearcher.new(output, input)
    expect(data_searcher.get_input).to eq("Z")
  end

  it 'prompts the user for input' do
    data_searcher = DataSearcher.new(output)
    data_searcher.ask_user_for_input
    expect(output.string).to eq("Please enter some text. We'll use this to search our records:\n")
  end

  it "Returns 'No results found' for string 'Z'" do
    data_searcher = DataSearcher.new(output)
    data_searcher.get_matching_results("Z")
    expect(output.string).to eq("No results found.\n")
  end

end
