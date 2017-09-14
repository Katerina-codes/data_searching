require 'data_searcher'

RSpec.describe DataSearcher do

  let(:output) { StringIO.new }

  it "Returns all data records for names that contain letter" do
    data_searcher = get_data_searcher
    record = ['annie', 'lennox']
    records = { "annie lennox" => record }
    expect(data_searcher.get_matching_results("a", records)).to eq([record])
  end

  it "Returns all data records for names that contain 'ae'" do
    data_searcher = get_data_searcher
    expect(data_searcher.get_matching_results("ae")).to eq([['Michaela', 'Michaelson', 'District Manager', '2015-12-19']])
  end

  it "still returns results if user enters all lower case" do
    data_searcher = get_data_searcher
    expect(data_searcher.get_matching_results("Joh")).to eq([['John', 'Johnson', 'Manager', '2016-12-31']])
  end

  it "Returns an empty array if no results are found' " do
    data_searcher = get_data_searcher
    expect(data_searcher.get_matching_results('z')).to eq([])
  end

  def get_data_searcher
    DataSearcher.new
  end

end
