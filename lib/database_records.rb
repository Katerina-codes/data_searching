class DatabaseRecords

  def initialize(database)
    @database = database
  end

  def access_records
    @database[:employee].all
  end

  def write_to_records(record)
    each_record_value = record.split(",")
    @database[:employee].insert(first_name: each_record_value[0], last_name: each_record_value[1], role: each_record_value[2], end_of_employment: nil)
  end

  def delete_all_records
    @database[:employee].delete
  end
end
