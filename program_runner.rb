require_relative 'lib/program_manager'
require_relative 'lib/data_searcher'
require_relative 'lib/ui'
require_relative 'lib/table'

new_search = ProgramManager.new(UI.new, DataSearcher.new, Table.new)
new_search.user_flow
