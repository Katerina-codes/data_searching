require 'database_records'
require 'sequel'

RSpec.describe DatabaseRecords do

  it "returns empty list when there is no records" do
    DB = Sequel.connect('mysql2://test-user:coolbeans@localhost:3306/test_database')
    database_records = DatabaseRecords.new(DB)

    expect(database_records.access_records).to eq([])
  end
end

