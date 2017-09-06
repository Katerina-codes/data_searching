require 'data_searcher'

RSpec.describe DataSearcher do

  it 'Gets input from the user' do
    input = StringIO.new('Z')
    data_searcher = DataSearcher.new(input)
    expect(data_searcher.get_input).to eq('Z')
  end

end
