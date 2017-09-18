require 'program_manager'
require 'ui'
require 'data_searcher'

RSpec.describe ProgramManager do

  let(:ui) { instance_double('UI') }
  let(:table) { instance_double('Table') }
  let(:data_searcher) { instance_double('DataSearcher') }

  it "User provides the search criteria" do
    program_manager = ProgramManager.new(ui, data_searcher, table)
    allow(ui).to receive(:ask_user_for_input)
    allow(ui).to receive(:get_valid_input)
    allow(data_searcher).to receive(:get_matching_results)
    allow(ui).to receive(:format_results)

    expect(ui).to receive(:get_search_criteria)

    program_manager.user_flow
  end

end
