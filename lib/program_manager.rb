class ProgramManager

  def initialize(ui, datasearcher, table)
    @ui = ui
    @datasearcher = datasearcher
    @table = table
  end

  def user_flow
    search_criteria = @ui.get_search_criteria(@table)
    record_data = create_data_hash(access_records)
    results = @datasearcher.get_matching_results(search_criteria, record_data)
    @ui.format_results(results)
  end

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
