require_relative 'ui'

class DataSearcher

  DATA = {
    "John Johnson" => ['John', 'Johnson', 'Manager', '2016-12-31'],
    "Tou, Xiong" => ['Tou, Xiong, Software Engineer', '2016-12-31'],
    "Michaela Michaelson" => ['Michaela', 'Michaelson', 'District Manager', '2015-12-19'],
    "Jake Jacobson" => ['Jake', 'Jacobson', 'Programmer'],
    "Jacquelyn Jackson" => ['Jacquelyn', 'Jackson', 'DBA'],
    "Sally Weber" => ['Sally', 'Weber', 'Web Developer', '2015-12-18'],
  }

  def initialize(ui)
    @ui = UI.new
  end

  def user_flow
    @ui.ask_user_for_input
    input = @ui.get_input
    get_matching_results(input)
  end

  def get_matching_results(input)
    no_results = []
    if input == "Z"
      no_results
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

end
