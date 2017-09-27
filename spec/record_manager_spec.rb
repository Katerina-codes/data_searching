require 'record_manager'

RSpec.describe RecordManager do

  it 'dynamically creates a hash with two lines of data' do
    record_manager = RecordManager.new
    records = "annie,lennox,singer,N/A\nbob,marley,singer,N/A"
    expect(record_manager.create_data_hash(records)).to eq([{ :first_name => 'annie', :last_name => 'lennox', :role => 'singer', :date => 'N/A' }, { :first_name => 'bob', :last_name => 'marley', :role => 'singer', :date => 'N/A' }])
  end

  it 'dynamically creates a hash with three lines of data' do
    record_manager = RecordManager.new
    records = "annie,lennox,singer,N/A\nbob,marley,singer,N/A\ncraig,david,superstar,N/A"
    expect(record_manager.create_data_hash(records)).to eq([{ :first_name => 'annie', :last_name => 'lennox', :role => 'singer', :date => 'N/A' }, { :first_name => 'bob', :last_name => 'marley', :role => 'singer', :date => 'N/A' }, { :first_name => 'craig', :last_name => 'david', :role => 'superstar', :date => 'N/A' }] )
  end

  let(:file_spy) { spy(File) }
  let(:filepath) { 'filepath' }
  let(:record_manager) { RecordManager.new(filepath) }

  context 'accessing records' do

    it 'opens a file' do
      expect(File).to receive(:open).with(filepath, 'r').and_return(file_spy)

      record_manager.access_records
    end

    it 'reads a file' do
      expect(File).to receive(:open).with(filepath, 'r').and_return(file_spy)

      record_manager.access_records

      expect(file_spy).to have_received(:read)
    end

    it 'formats one result' do
      file_content = 'annie,lennox,singer,N/A'
      record = [{
        first_name: 'annie',
        last_name: 'lennox',
        role: 'singer',
        date: 'N/A'
      }]

      allow(file_spy).to receive(:read).and_return(file_content)
      allow(File).to receive(:open).and_return(file_spy)

      expect(record_manager.access_records).to eq(record)
    end

  end

  context 'writing to records' do

    it 'opens a file' do
      expect(File).to receive(:open).with(filepath, 'a').and_return(file_spy)

      record_manager.write_to_records('record')
    end

    it 'appends to the end of a file' do
      expect(File).to receive(:open).with(filepath, 'a').and_return(file_spy)

      record_manager.write_to_records('record')

      expect(file_spy).to have_received(:puts).with('record')
    end
  end

end
