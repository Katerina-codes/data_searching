class RecordManager

  def access_records
    file = 'lib/records.txt'
    records = File.open(file, "r")
    records.read
  end

  def write_to_records(user_record)
    file = 'lib/records.txt'
    open_file = File.open(file, "a")
    open_file.puts user_record
  end

  def create_data_hash(records)
    records.split("\n").map do |record|
      record = record.split(",")
      {
        first_name: record[0],
        last_name: record[1],
        role: record[2],
        date: record[3]
      }
    end
  end
end
