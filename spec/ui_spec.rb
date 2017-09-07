require 'ui'

RSpec.describe UI do  
  
  it 'prompts the user for input' do
    output = StringIO.new
    ui = UI.new(output)
    ui.ask_user_for_input
    expect(output.string).to eq("Please enter some text. We'll use this to search our records:\n")
  end
 
  it 'gets input from the user' do
    output = StringIO.new
    input = StringIO.new("Z")
    ui = UI.new(output, input)
    expect(ui.get_input).to eq("Z")
  end

  it "displays message when there's no results" do
    output = StringIO.new
    ui = UI.new(output)
    ui.display_no_results_message
    expect(output.string).to eq("No results found.\n")
  end

end
