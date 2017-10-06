class DatabaseRecords

  def initialize(database)
    @database = database
  end

  def access
    @database[:employee].all
  end

  def write_to(record)
    each_record_value = record.split(",")
    @database[:employee].insert(first_name: each_record_value[0], last_name: each_record_value[1], role: each_record_value[2], end_of_employment: nil)
  end

  def delete_all
    @database[:employee].delete
  end
end
