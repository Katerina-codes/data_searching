class ProgramManager

  def initialize(ui = UI.new, datasearcher = DataSearcher.new)
    @ui = ui
    @datasearcher = datasearcher
  end

  def user_flow
    @ui.ask_user_for_input
    input = @ui.get_valid_input
    results = @datasearcher.get_matching_results(input)
    @ui.format_results(results)
  end

end
