class UI
  SEARCH_TYPES = {
    "1" => "name",
    "2" => "role"
  }

  def initialize(output = $stdout, input = $stdin)
    @output = output
    @input = input
  end

  def get_search_criteria(table_instance)
    search_type = get_user_input
    search_value = get_valid_input(table_instance)
    { search_type: SEARCH_TYPES[search_type],
      search_value: search_value }
  end

  def ask_user_for_input
    @output.puts "Please enter some text. We'll use this to search our records:"
  end

  def get_user_input
    @input.gets.chomp
  end

  def get_input
    @input.gets.chomp.downcase
  end

  def display_no_results_message
    @output.puts "No results found."
  end

  def format_results(results)
      @output.puts """\n            Name            |            Role            |            Seperation Date            |
---------------------------- ---------------------------- ---------------------------------------"""
    results.each do |record|
	      @output.puts "     #{record[:first_name].capitalize} #{record[:last_name].capitalize}     |     #{record[:role].split(" ").map do |word| word.capitalize end.join(" ")}     |    #{record[:date]}    |"
    end
  end

  def get_valid_input(table_instance)
    ask_user_for_input
    input = get_input
    until table_instance.is_input_valid?(input)
       ask_user_for_input
       input = get_input
    end
    input
  end

  def ask_search_type
    @output.puts "Please enter 'name' to search by name or 'role' to search by role:\n"
  end

  def get_search_type
    @input.gets.chomp
  end
end
