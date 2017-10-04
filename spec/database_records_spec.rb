require 'database_records'

RSpec.describe DatabaseRecords do

  it "returns empty list when there is no records" do
    database_records = DatabaseRecords.new

    expect(database_records.access_records).to eq([])
  end
end

