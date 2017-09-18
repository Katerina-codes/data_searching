class DataSearcher

  DATA = [{:first_name => 'jacquelyn', :last_name => 'jackson', :role => 'DBA', :date => 'N/A'},
    {:first_name => 'jake', :last_name => 'jacobson', :role => 'Programmer', :date => 'N/A'},
    {:first_name => 'john', :last_name => 'johnson', :role => 'manager', :date => '2016-12-31'},
    {:first_name => 'michaela', :last_name => 'michaelson', :role => 'District Manager', :date => '2015-12-19'},
    {:first_name => 'tou', :last_name => 'xiong', :role => 'Software Engineer', :date => '2016-10-05'}]

  def get_matching_results(search_criteria, records = DATA)
    no_results = []
    if find_matching_results(search_criteria, records) == no_results
      no_results
    else
      find_matching_results(search_criteria, records)
    end
  end

  private

  def find_matching_results(search_criteria, records)
    input = search_criteria[:search_value]
    if search_criteria[:search_type] == "name"
      records.select do |record|
        record[:first_name].include?(input.downcase) || record[:last_name].include?(input.downcase)
      end.sort
    else
      records.select do |record|
        record[:role].include?(input.downcase)
      end.sort
    end
  end
end
