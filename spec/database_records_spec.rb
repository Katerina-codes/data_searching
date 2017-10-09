require 'database_records'
require 'sequel'

RSpec.describe DatabaseRecords do

  let(:database_records) { DatabaseRecords.new(Sequel.connect('mysql2://test-user:coolbeans@localhost:3306/test_database')) }

  before(:each) do
    database_records.delete_all
  end

  it "returns empty list when there is no records" do
    DB = Sequel.connect('mysql2://test-user:coolbeans@localhost:3306/test_database')

    expect(database_records.access).to eq([])
  end

  it "inserts a record to the database" do
    DB = Sequel.connect('mysql2://test-user:coolbeans@localhost:3306/test_database')
    record = "Lady,Gaga,Singer"

    database_records.write_to(record)

    expect(database_records.access).to eq(
    [{
      first_name: 'Lady',
      last_name: 'Gaga',
      role: 'Singer',
      end_of_employment: nil
    }])
  end
end

