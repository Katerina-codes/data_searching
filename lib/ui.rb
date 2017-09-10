class UI
  def initialize(output = $stdout, input = $stdin)
    @output = output
    @input = input
  end

  def ask_user_for_input
    @output.puts "Please enter some text. We'll use this to search our records:"
  end

  def get_input
    @input.gets.chomp
  end

  def display_no_results_message
    @output.puts "No results found."
  end

  def format_results(results)
    @output.puts  """\n       Name        |           Role            |  Seperation Date |
------------------- --------------------------- ------------------"""
    results.each do |record|
      first_name, last_name, role, date = record
      @output.puts "     #{first_name} #{last_name}     |     #{role}     |    #{date}    |"
    end
  end
end
