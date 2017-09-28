require_relative 'lib/program_manager'
require_relative 'lib/data_searcher'
require_relative 'lib/ui'
require_relative 'lib/table'
require_relative 'lib/record_manager'

record_file = 'lib/records.txt'

new_search = ProgramManager.new(UI.new, DataSearcher.new, Table.new, RecordManager.new(record_file))
new_search.user_flow
