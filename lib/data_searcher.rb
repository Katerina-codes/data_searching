class DataSearcher

  DATA = [{:first_name => 'jacquelyn', :last_name => 'jackson', :role => 'dba', :date => 'N/A'},
    {:first_name => 'jake', :last_name => 'jacobson', :role => 'programmer', :date => 'N/A'},
    {:first_name => 'john', :last_name => 'johnson', :role => 'manager', :date => '2016-12-31'},
    {:first_name => 'michaela', :last_name => 'michaelson', :role => 'district manager', :date => '2015-12-19'},
    {:first_name => 'sally', :last_name => 'weber', :role => 'web developer', :date => '2014-12-18'},
    {:first_name => 'tou', :last_name => 'xiong', :role => 'software engineer', :date => '2016-10-05'}]

  def get_matching_results(search_criteria, records = DATA)
    no_results = []
    if find_matching_results(search_criteria, records) == no_results
      no_results
    else
      find_matching_results(search_criteria, records)
    end
  end

  def access_records
    file = 'lib/records.txt'
    records = File.open(file, "r")
    records.read
  end

  def create_data_hash(records)
    records.split("\n").map do |record|
    record = record.split(",")
      Hash[:first_name, record[0], :last_name, record[1], :role, record[2], :date, record[3]]
    end
  end

  private

  def find_matching_results(search_criteria, records)
    input = search_criteria[:search_value]
    if search_criteria[:search_type] == "name"
      matching_records = records.select do |record|
        record[:first_name].include?(input.downcase) || record[:last_name].include?(input.downcase)
      end
    else
      matching_records = records.select do |record|
        record[:role].include?(input.downcase)
      end
    end
    matching_records.sort_by { |key, value| key[:first_name] }
  end
end
