require_relative 'lib/program_manager'
require_relative 'lib/data_searcher'
require_relative 'lib/ui'

ui_instance = UI.new
new_search = ProgramManager.new(ui_instance, DataSearcher.new(ui_instance))
new_search.user_flow
