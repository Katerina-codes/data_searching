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
    input = StringIO.new("!\na")
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
    expect(output.string).to eq("Please enter 'name' to search by name or 'role' to search by role:\n")
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

  def create_ui(input = StringIO.new)
    UI.new(output, input)
  end
end
