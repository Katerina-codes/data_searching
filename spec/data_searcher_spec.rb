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
    record = ['Michaela', 'Michaelson']
    records = { "michaela michaelson" => record }
    expect(data_searcher.get_matching_results("ae", records)).to eq([record])
  end

  it "Still returns results if user enters a mix of cases" do
    data_searcher = get_data_searcher
    record = ['John', 'Johnson']
    records = { "john johnson" => record }
    expect(data_searcher.get_matching_results("Joh", records)).to eq([record])
  end

  it "Returns an empty array if no results are found' " do
    data_searcher = get_data_searcher
    expect(data_searcher.get_matching_results('z')).to eq([])
  end

  def get_data_searcher
    DataSearcher.new
  end

end
