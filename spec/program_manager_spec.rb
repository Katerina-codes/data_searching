require 'program_manager'
require 'ui'
require 'data_searcher'

RSpec.describe ProgramManager do

  let(:ui) { double() }

  it "ProgramManager checks user flow" do
    program_manager = ProgramManager.new(ui, DataSearcher.new)
    expect(ui).to receive(:ask_user_for_input)
    expect(ui).to receive(:get_valid_input).and_return("x")
    expect(ui).to receive(:format_results)

    program_manager.user_flow
  end
end
