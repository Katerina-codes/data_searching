require_relative 'lib/program_manager'
require_relative 'lib/data_searcher'
require_relative 'lib/ui'
require_relative 'lib/table'
require_relative 'lib/database_records'
require 'sequel'


database = Sequel.connect('mysql2://record_searcher_user:applerun@localhost:3306/employee_records')


new_search = ProgramManager.new(UI.new, DataSearcher.new, Table.new, DatabaseRecords.new(database))
new_search.user_flow
