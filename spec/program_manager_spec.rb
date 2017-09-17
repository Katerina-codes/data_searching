require 'program_manager'
require 'ui'
require 'data_searcher'

RSpec.describe ProgramManager do

  let(:ui) { instance_double('UI') }
  let(:table) { instance_double('Table') }
  let(:data_searcher) { instance_double('DataSearcher') }

  it "ProgramManager checks user flow" do
    program_manager = ProgramManager.new(ui, data_searcher, table)

    expect(ui).to receive(:get_search_type).and_return("name")
    expect(ui).to receive(:ask_user_for_input)
    expect(ui).to receive(:get_valid_input).and_return("x")
    expect(data_searcher).to receive(:get_matching_results)
    expect(ui).to receive(:format_results)

    program_manager.user_flow
  end
end
