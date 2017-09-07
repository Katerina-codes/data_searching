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
  end

  def get_input
    @input.gets.chomp
  end

  def ask_user_for_input
    @output.puts "Please enter some text. We'll use this to search our records:"
  end

  def get_matching_results(input)
    if input == "Z"
      @output.puts "No results found."
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

  def format_results(results)
    first_name, last_name, role, date = results
    @output.puts """\n       Name        |           Role            |  Seperation Date |
------------------- --------------------------- ------------------
     #{first_name} #{last_name}     |     #{role}     |    #{date}    |"""
  end

  def user_flow
    ask_user_for_input
    input = get_input
    get_matching_results(input)
  end

end
