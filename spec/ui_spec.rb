require 'ui'
require 'table'

RSpec.describe UI do
  let(:output) { StringIO.new }

  it 'prompts the user for input' do
    create_ui.ask_user_for_input
    expect(output.string).to eq("Please enter some text. We'll use this to search our records:\n")
  end

  it 'gets input from the user' do
    ui = create_ui(StringIO.new("Z"))
    expect(ui.get_input).to eq("z")
  end

  it "displays message when there's no results" do
    create_ui.display_no_results_message
    expect(output.string).to eq("No results found.\n")
  end

  it "formats the data returned for string 'X' into a table" do
    ui = UI.new(output)
    ui.format_results([{ :first_name => 'Tou', :last_name => 'Xiong', :role => 'Software Engineer', :date => '2016-10-05' }])
    expect(output.string).to eq("""
            Name            |            Role            |            Seperation Date            |
---------------------------- ---------------------------- ---------------------------------------
     Tou Xiong     |     Software Engineer     |    2016-10-05    |\n""")
  end

  it "returns a prompt until user enters valid text" do
    input = StringIO.new("1\n!\na")
    ui = create_ui(input)
    ui.get_search_criteria(Table.new)
    expect(output.string).to include("Please enter some text. We'll use this to search our records")
  end

  it "does not reject input if it's uppercase" do
    input = StringIO.new("Dan")
    ui = create_ui(input)
    expect(ui.get_valid_input(Table.new)).to eq("dan")
  end

  it "asks the user for a search type" do
    create_ui.ask_search_type
    expect(output.string).to eq("Please enter '1' to search by name or '2' to search by role or '3' to add a record:\n")
  end

  it "gets input for search by name" do
    input = StringIO.new("1\nalice")
    ui = create_ui(input)
    search_criteria = {
      search_type: "name",
      search_value: "alice"
    }

    expect(ui.get_search_criteria(Table.new)).to eq(search_criteria)
  end

  it "gets input for search by role" do
    input = StringIO.new("2\nSinger")
    ui = create_ui(input)
    search_criteria = {
      search_type: "role",
      search_value: "singer"
    }

    expect(ui.get_search_criteria(Table.new)).to eq(search_criteria)
  end

  it "reject's invalid search type input" do
    input = StringIO.new("a\n1")
    ui = create_ui(input)
    ui.get_valid_search_type(Table.new)
    expect(output.string).to include("Please enter '1' to search by name or '2' to search by role or '3' to add a record:\n")
  end

  it "returns a valid search type" do
    input = StringIO.new("1")
    ui = create_ui(input)
    expect(ui.get_valid_search_type(Table.new)).to eq(1)
  end

  it "returns a valid search type if it's 2" do
    input = StringIO.new("2")
    ui = create_ui(input)
    expect(ui.get_valid_search_type(Table.new)).to eq(2)
  end

  it "asks for user's first name" do
    create_ui.ask_for_first_name
    expect(output.string).to eq("Please enter your first name:\n")
  end

  it "asks for user's second name" do
    create_ui.ask_for_last_name
    expect(output.string).to eq("Please enter your last name:\n")
  end

  it "asks for user's role" do
    create_ui.ask_for_role
    expect(output.string).to eq("Please enter your role:\n")
  end

  it "asks for user's separation date" do
    create_ui.ask_for_separation_date
    expect(output.string).to eq("Please enter your separation date if applicable\n")
  end

  it "gets user input and returns a user record" do
    input = StringIO.new("lady\ngaga\nsinger\nN/A")
    ui = create_ui(input)
    expect(ui.get_user_record).to eq("lady, gaga, singer, N/A")
  end

  it "returns 'N/A' if user enters 0" do
    input = StringIO.new("lady\ngaga\nsinger\n0")
    ui = create_ui(input)
    expect(ui.get_user_record).to eq("lady, gaga, singer, N/A")
  end

  def create_ui(input = StringIO.new)
    UI.new(output, input)
  end
end
