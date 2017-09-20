require 'record_manager'

RSpec.describe RecordManager do

  it "reads in all records from a file" do
    record_manager = RecordManager.new
    expect(record_manager.access_records).to include("jacquelyn")
    expect(record_manager.access_records).to include("2016-10-05")
  end

  it "dynamically creates a hash with one line of data" do
    record_manager = RecordManager.new
    records = "annie,lennox,singer,N/A"
    expect(record_manager.create_data_hash(records)).to eq([{ :first_name => 'annie', :last_name => 'lennox', :role => 'singer', :date => 'N/A' }])
  end

  it "dynamically creates a hash with two lines of data" do
    record_manager = RecordManager.new
    records = "annie,lennox,singer,N/A\nbob,marley,singer,N/A"
    expect(record_manager.create_data_hash(records)).to eq([{ :first_name => 'annie', :last_name => 'lennox', :role => 'singer', :date => 'N/A' }, { :first_name => 'bob', :last_name => 'marley', :role => 'singer', :date => 'N/A' }])
  end

  it "dynamically creates a hash with three lines of data" do
    record_manager = RecordManager.new
    records = "annie,lennox,singer,N/A\nbob,marley,singer,N/A\ncraig,david,superstar,N/A"
    expect(record_manager.create_data_hash(records)).to eq([{ :first_name => 'annie', :last_name => 'lennox', :role => 'singer', :date => 'N/A' }, { :first_name => 'bob', :last_name => 'marley', :role => 'singer', :date => 'N/A' }, { :first_name => 'craig', :last_name => 'david', :role => 'superstar', :date => 'N/A' }] )
  end
end
