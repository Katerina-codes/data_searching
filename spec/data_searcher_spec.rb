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
    record = { :first_name => 'annie', :last_name => 'lennox', :role => 'singer' }
    search_criteria = { search_type: "role", search_value: "a" }

    expect(data_searcher.get_matching_results(search_criteria, [record])).to eq([])
  end

  it "Returns a result if there's a role match" do
    data_searcher = get_data_searcher
    record = { :first_name => 'michaela', :last_name => 'michaelson', :role => 'district manager' }
    search_criteria = { search_type: "role", search_value: "D" }

    expect(data_searcher.get_matching_results(search_criteria, [record])).to eq([record])
  end

  it "Returns and sorts multiple records for a name match" do
    data_searcher = get_data_searcher
    records = [{ :first_name => 'bob', :last_name => 'marley', :role => 'singer' }, { :first_name => 'annie', :last_name => 'lennox', :role => 'singer' }]
    search_criteria = { search_type: "name", search_value: "a" }

    expect(data_searcher.get_matching_results(search_criteria, records)).to eq([{ :first_name => 'annie', :last_name => 'lennox', :role => 'singer' }, { :first_name => 'bob', :last_name => 'marley', :role => 'singer' }])
  end

  it "Returns and sorts multiple records for a role match" do
    data_searcher = get_data_searcher
    records = [{ :first_name => 'bob', :last_name => 'marley', :role => 'singer' }, { :first_name => 'annie', :last_name => 'lennox', :role => 'singer' }]
    search_criteria = { search_type: "role", search_value: "s" }

    expect(data_searcher.get_matching_results(search_criteria, records)).to eq([{ :first_name => 'annie', :last_name => 'lennox', :role => 'singer' }, { :first_name => 'bob', :last_name => 'marley', :role => 'singer' }])
  end

  it "reads in all records from a file" do
    data_searcher = get_data_searcher
    expect(data_searcher.access_records).to include("jacquelyn")
    expect(data_searcher.access_records).to include("2016-10-05")
  end

  it "dynamically creates a hash with one line of data" do
    data_searcher = get_data_searcher
    records = "annie, lennox, singer, N/A"
    expect(data_searcher.create_data_hash(records)).to eq([{ :first_name => 'annie', :last_name => 'lennox', :role => 'singer' }])
  end

  it "dynamically creates a hash with two lines of data" do
    data_searcher = get_data_searcher
    records = "annie, lennox, singer, N/A\nbob, marley, singer, N/A"
    expect(data_searcher.create_data_hash(records)).to eq([{ :first_name => 'annie', :last_name => 'lennox', :role => 'singer' }, { :first_name => 'bob', :last_name => 'marley', :role => 'singer' }])
  end

  def get_data_searcher
    DataSearcher.new
  end

end
