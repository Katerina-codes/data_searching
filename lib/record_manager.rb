class RecordManager

  def access_records
    file = 'lib/records.txt'
    records = File.open(file, "r")
    records.read
  end

  def create_data_hash(records)
    records.split("\n").map do |record|
      record = record.split(",")
      Hash[:first_name, record[0], :last_name, record[1], :role, record[2], :date, record[3]]
    end
  end
end
