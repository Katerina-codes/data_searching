require_relative 'lib/program_manager'
require_relative 'lib/data_searcher'
require_relative 'lib/ui'
require_relative 'lib/table'
require_relative 'lib/record_manager'

new_search = ProgramManager.new(UI.new, DataSearcher.new, Table.new, RecordManager.new)
new_search.user_flow
