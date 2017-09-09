require 'data_searcher'
require 'ui'

RSpec.describe DataSearcher do

  let(:ui) { double() }
  let(:output) { StringIO.new }

  it "Returns all data records for names that contain letter 'A'" do
    data_searcher = get_data_searcher(ui)
    expect(data_searcher.get_matching_results("A")).to eq([['Jacquelyn', 'Jackson', 'DBA'], ['Jake', 'Jacobson', 'Programmer'], ['Michaela', 'Michaelson', 'District Manager', '2015-12-19'], ['Sally', 'Weber', 'Web Developer', '2015-12-18']])
  end

  it "Returns all data records for names that contain letter 'B'" do
    data_searcher = get_data_searcher(ui)
    expect(data_searcher.get_matching_results("B")).to eq([['Jake', 'Jacobson', 'Programmer'], ['Sally', 'Weber', 'Web Developer', '2015-12-18']])
  end

  it "Returns all data records for names that contain letter 'C'" do
    data_searcher = get_data_searcher(ui)
    expect(data_searcher.get_matching_results("C")).to eq([['Jacquelyn', 'Jackson', 'DBA'], ['Jake', 'Jacobson', 'Programmer'], ['Michaela', 'Michaelson', 'District Manager', '2015-12-19']])
  end

  def get_data_searcher(ui)
    DataSearcher.new(ui)
  end

end
