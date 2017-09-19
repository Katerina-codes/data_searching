require 'program_manager'
require 'ui'
require 'data_searcher'
require 'table'

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

  it "goes through the whole flow" do
    input = StringIO.new("1\nx")
    output = StringIO.new
    ui_with_input = UI.new(output, input)
    program_manager = ProgramManager.new(ui_with_input, DataSearcher.new, Table.new)

    program_manager.user_flow

    expect(output.string).to include("Name")
    expect(output.string).to include("2016-10-05")
  end

  it "reads in all records from a file" do
    program_manager = ProgramManager.new(UI.new, DataSearcher.new, Table.new)
    expect(program_manager.access_records).to include("jacquelyn")
    expect(program_manager.access_records).to include("2016-10-05")
  end

  it "dynamically creates a hash with one line of data" do
    program_manager = ProgramManager.new(UI.new, DataSearcher.new, Table.new)
    records = "annie,lennox,singer,N/A"
    expect(program_manager.create_data_hash(records)).to eq([{ :first_name => 'annie', :last_name => 'lennox', :role => 'singer', :date => 'N/A' }])
  end

  it "dynamically creates a hash with two lines of data" do
    program_manager = ProgramManager.new(UI.new, DataSearcher.new, Table.new)
    records = "annie,lennox,singer,N/A\nbob,marley,singer,N/A"
    expect(program_manager.create_data_hash(records)).to eq([{ :first_name => 'annie', :last_name => 'lennox', :role => 'singer', :date => 'N/A' }, { :first_name => 'bob', :last_name => 'marley', :role => 'singer', :date => 'N/A' }])
  end

  it "dynamically creates a hash with three lines of data" do
    program_manager = ProgramManager.new(UI.new, DataSearcher.new, Table.new)
    records = "annie,lennox,singer,N/A\nbob,marley,singer,N/A\ncraig,david,superstar,N/A"
    expect(program_manager.create_data_hash(records)).to eq([{ :first_name => 'annie', :last_name => 'lennox', :role => 'singer', :date => 'N/A' }, { :first_name => 'bob', :last_name => 'marley', :role => 'singer', :date => 'N/A' }, { :first_name => 'craig', :last_name => 'david', :role => 'superstar', :date => 'N/A' }] )
  end

end
