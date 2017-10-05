class DatabaseRecords

  def initialize(database)
    @database = database
  end

  def access_records
    @database[:employee].all
  end
end
