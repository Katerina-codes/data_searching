class ProgramManager

  def initialize(ui, datasearcher, table)
    @ui = ui
    @datasearcher = datasearcher
    @table = table
  end

  def user_flow
    search_criteria = @ui.get_search_criteria(@table)
    results = @datasearcher.get_matching_results(search_criteria)
    @ui.format_results(results)
  end

end
