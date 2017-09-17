class ProgramManager

  def initialize(ui, datasearcher, table)
    @ui = ui
    @datasearcher = datasearcher
    @table = table
  end

  def user_flow
    search_type = @ui.get_search_type
    @ui.ask_user_for_input
    input = @ui.get_valid_input(@table)
    results = @datasearcher.get_matching_results(input, search_type)
    @ui.format_results(results)
  end

end
