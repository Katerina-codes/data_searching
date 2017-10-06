class RecordManager

  def initialize(file)
    @file = file
  end

  def access
    records = File.open(@file, 'r')
    create_data_hash(records.read)
  end

  def write_to(record)
    file = File.open(@file, 'a')
    file.puts(record)
  end

  private

  def create_data_hash(records)
    records.split("\n").map do |record|
      record = record.split(',')
      {
        first_name: record[0],
        last_name: record[1],
        role: record[2],
        date: record[3]
      }
    end
  end
end
