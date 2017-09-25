require 'program_manager'
require 'ui'
require 'data_searcher'
require 'table'
require 'record_manager'

RSpec.describe ProgramManager do

  let(:ui) { instance_double('UI') }
  let(:table) { instance_double('Table') }
  let(:data_searcher) { instance_double('DataSearcher') }
  let(:record_manager) { instance_double('RecordManager') }

  it "User provides the search criteria" do
    program_manager = ProgramManager.new(ui, data_searcher, table, record_manager)
    allow(ui).to receive(:get_user_intention).and_return("1")
    allow(ui).to receive(:ask_user_for_input)
    allow(record_manager).to receive(:access_records)
    allow(record_manager).to receive(:create_data_hash)
    allow(ui).to receive(:get_valid_input)
    allow(data_searcher).to receive(:get_matching_results)
    allow(ui).to receive(:format_results)

    expect(ui).to receive(:get_search_criteria)

    program_manager.user_flow
  end

  it "goes through the whole flow" do
    input = StringIO.new("1\n1\nx")
    output = StringIO.new
    ui_with_input = UI.new(output, input)
    program_manager = ProgramManager.new(ui_with_input, DataSearcher.new, Table.new, RecordManager.new)

    program_manager.user_flow

    expect(output.string).to include("Name")
    expect(output.string).to include("2016-10-05")
  end

  it "asks the user for their intention" do
    program_manager = ProgramManager.new(ui, data_searcher, table, record_manager)
    allow(ui).to receive(:get_search_criteria)
    allow(record_manager).to receive(:access_records)
    allow(record_manager).to receive(:create_data_hash)
    allow(data_searcher).to receive(:get_matching_results)
    allow(ui).to receive(:format_results)

    expect(ui).to receive(:get_user_intention).and_return("1")

    program_manager.user_flow
  end

  it "adds a new record to the records file" do
    program_manager = ProgramManager.new(ui, data_searcher, table, record_manager)
    allow(ui).to receive(:get_user_intention)
    allow(ui).to receive(:get_search_criteria)
    allow(ui).to receive(:get_user_record)

    expect(record_manager).to receive(:write_to_records)

    program_manager.user_flow
  end

end
