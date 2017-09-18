require 'data_searcher'

RSpec.describe DataSearcher do

  let(:output) { StringIO.new }

  it "Returns all data records if first name contains letter" do
    data_searcher = get_data_searcher
    record = { :first_name => 'annie' }
    records = [record]
    search_criteria = { search_type: "name", search_value: "a" }
    expect(data_searcher.get_matching_results(search_criteria, records)).to eq([record])
  end

  it "Returns all data records if last name contains letter" do
    data_searcher = get_data_searcher
    record = { :first_name => 'annie', :last_name => 'lennox' }
    records = [record]
    search_criteria = { search_type: "name", search_value: "a" }
    expect(data_searcher.get_matching_results(search_criteria, records)).to eq([record])
  end

  it "Returns all data records if first name contains 'ae'" do
    data_searcher = get_data_searcher
    record = { :first_name => 'michaela' }
    records = [record]
    search_criteria = { search_type: "name", search_value: "ae" }

    expect(data_searcher.get_matching_results(search_criteria, records)).to eq([record])
  end

  it "Still returns results if user enters a mix of cases" do
    data_searcher = get_data_searcher
    record = { :first_name => 'john', :last_name => 'johnson' }
    records = [record]
    search_criteria = { search_type: "name", search_value: "Joh" }

    expect(data_searcher.get_matching_results(search_criteria, records)).to eq([record])
  end

  it "Returns an empty array if no matching results are found in first or last name" do
    data_searcher = get_data_searcher
    record = { :first_name => 'annie', :last_name => 'lennox' }
    records = [record]
    search_criteria = { search_type: "name", search_value: "z" }

    expect(data_searcher.get_matching_results(search_criteria, records)).to eq([])
  end

  it "Returns an empty array if no matching results are found in role" do
    data_searcher = get_data_searcher
    record = { :first_name => 'annie', :last_name => 'Lennox', :role => 'Singer' }
    search_criteria = { search_type: "role", search_value: "a" }

    expect(data_searcher.get_matching_results(search_criteria, [record]))
  end

  def get_data_searcher
    DataSearcher.new
  end

end
