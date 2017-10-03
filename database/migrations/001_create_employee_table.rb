require 'sequel'

Sequel.migration do
  up do
    create_table(:employee) do
      primary_key :id
      String :first_name
      String :last_name
      String :role
      Date :end_of_employment
    end
  end

 down do
   drop_table(:employee)
 end
end
