require 'ui'

class DataSearcher

  DATA = {
    "John Johnson" => ['John', 'Johnson', 'Manager', '2016-12-31'],
    "Tou, Xiong" => ['Tou, Xiong, Software Engineer', '2016-12-31'],
    "Michaela Michaelson" => ['Michaela', 'Michaelson', 'District Manager', '2015-12-19'],
    "Jake Jacobson" => ['Jake', 'Jacobson', 'Programmer'],
    "Jacquelyn Jackson" => ['Jacquelyn', 'Jackson', 'DBA'],
    "Sally Weber" => ['Sally', 'Weber', 'Web Developer', '2015-12-18'],
  }

  def initialize(output = $stdout, input = $stdin)
    @output = output
    @input = input
    @ui = UI.new(output, input)
  end

  def get_input
    @ui.get_input
  end

  def ask_user_for_input
    @ui.ask_user_for_input
  end

  def get_matching_results(input)
    if input == "Z"
      @ui.display_no_results_message
    else
      find_matching_results(input)
    end
  end

  def find_matching_results(input)
    results = []
    DATA.select do |name, record|
      if name.include?(input.downcase)
        results.push(DATA[name])
      end
    end
    results.sort
  end

  def user_flow
    ask_user_for_input
    input = get_input
    get_matching_results(input)
  end

end
