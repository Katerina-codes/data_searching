class ProgramManager

  def initialize(ui, data_searcher, table, record_manager)
    @ui = ui
    @data_searcher = data_searcher
    @table = table
    @record_manager = record_manager
  end

  def user_flow
    if @ui.get_user_intention(@ui) == "1"
      search_criteria = @ui.get_search_criteria(@table)
      records = @record_manager.access_records
      record_data = @record_manager.create_data_hash(records)
      results = @data_searcher.get_matching_results(search_criteria, record_data)
     @ui.format_results(results)
    else
      @ui.get_user_record
    end
  end

end
