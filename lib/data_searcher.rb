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

  def get_matching_results(input)
    if input == 'Z'
      @output.puts "No results found."
    else
      @output.puts """John, Johnson, Manager, 2016-12-31
Michaela, Michaelson, District Manager, 2015-12-19
Jake, Jacobson, Programmer
Sally, Weber, Web Developer, 2015-12-18"""
    end
  end

end
