class RecordManager

  def initialize(file = 'lib/records.txt')
    @file = file
  end

  def access_records
    records =	File.open(@file, 'r')
    records.read
  end

  def write_to_records(record)
    file = File.open(@file, 'a')
    file.puts record
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
