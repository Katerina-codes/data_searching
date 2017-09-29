require 'sequel'

DB = Sequel.connect('mysql2://record_searcher_user:applerun@localhost:3306/employee_records')

DB.create_table :employee do
  primary_key :id
  String :first_name
  String :last_name
  String :role
  Date :end_of_employment
end
