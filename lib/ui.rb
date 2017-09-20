class UI
  SEARCH_TYPES = {
    1 => "name",
    2 => "role"
  }

  def initialize(output = $stdout, input = $stdin)
    @output = output
    @input = input
  end

  def get_search_criteria(table_instance)
    search_type = get_valid_search_type(table_instance)
    search_value = get_valid_input(table_instance)
    { search_type: SEARCH_TYPES[search_type],
      search_value: search_value }
  end

  def get_user_record
    not_applicable = "N/A"
    ask_for_first_name
    first_name = get_user_input
    ask_for_last_name
    last_name = get_user_input
    ask_for_role
    role = get_user_input
    ask_for_separation_date
    separation_date = get_user_input.to_i
    "#{first_name}, #{last_name}, #{role}, #{separation_date == 0 ? not_applicable : separation_date }"
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

  def get_valid_search_type(table_instance)
    ask_search_type
    input = get_user_input.to_i
    until table_instance.search_type_valid?(input)
      ask_search_type
      input = get_user_input.to_i
    end
    input
  end

  def ask_search_type
    @output.puts "Please enter '1' to search by name or '2' to search by role:\n"
  end

  def ask_for_first_name
    @output.puts "Please enter your first name:"
  end

  def ask_for_last_name
    @output.puts "Please enter your last name:"
  end

  def ask_for_role
    @output.puts "Please enter your role:"
  end

  def ask_for_separation_date
    @output.puts "Please enter your separation date if applicable"
  end
end
