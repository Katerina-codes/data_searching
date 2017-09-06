class DataSearcher

  def initialize(output = $STDOUT, input = $STDIN)
    @output = output
    @input = input
  end

  def get_input
    @input.gets.chomp
  end

  def ask_user_for_input
    @output.puts "Please enter some text. We'll use this to search our records:"
  end

  def get_matching_results(word)
    @output.puts "No results found."
  end

end
