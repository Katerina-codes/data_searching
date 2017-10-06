class DatabaseRecords

  def initialize(database)
    @database = database
  end

  def access
    @database[:employee].all
  end

  def write_to(record)
    each_record_value = record.split(",")
    create_data_hash(each_record_value)
  end

  def create_data_hash(records)
    @database[:employee].insert(first_name: records[0], last_name: records[1], role: records[2], end_of_employment: nil)
  end

  def delete_all
    @database[:employee].delete
  end
end
