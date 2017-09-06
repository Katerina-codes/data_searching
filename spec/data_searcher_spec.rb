require 'data_searcher'

RSpec.describe DataSearcher do
  
  it 'Gets a word from the user' do
    input = StringIO.new('Z') 
    data_searcher = DataSearcher.new(input) 
    expect(data_searcher.get_word).to eq('Z')
  end

end
