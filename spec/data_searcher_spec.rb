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

  it "Returns 'No results found' for letter 'Z'" do
    data_searcher = DataSearcher.new(output)
    data_searcher.get_matching_results("Z")
    expect(output.string).to eq("No results found.\n")
  end

  it "Returns all data records for names that contain letter 'A'" do
    data_searcher = DataSearcher.new(output)
    data_searcher.get_matching_results("A")
    expect(output.string).to eq("John, Johnson, Manager, 2016-12-31\nMichaela, Michaelson, District Manager, 2015-12-19\nJake, Jacobson, Programmer\nSally, Weber, Web Developer, 2015-12-18\n")
  end

  it "Returns all data records for names that contain letter 'B'" do
    data_searcher = DataSearcher.new(output)
    data_searcher.get_matching_results("B")
    expect(output.string).to eq("Jake, Jacobson, Programmer\nSally, Weber, Web Developer, 2015-12-18\n")
  end

end
