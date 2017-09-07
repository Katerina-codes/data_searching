require 'ui'

RSpec.describe UI do  
  let(:output) { StringIO.new }
 
  it 'prompts the user for input' do
    create_ui.ask_user_for_input
    expect(output.string).to eq("Please enter some text. We'll use this to search our records:\n")
  end
 
  it 'gets input from the user' do
    ui = create_ui(StringIO.new("Z"))
    expect(ui.get_input).to eq("Z")
  end

  it "displays message when there's no results" do
    create_ui.display_no_results_message
    expect(output.string).to eq("No results found.\n")
  end

 def create_ui(input = StringIO.new)
    UI.new(output, input)
 end
end
