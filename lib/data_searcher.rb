class DataSearcher

  DATA = {
    "john johnson" => ['John', 'Johnson', 'Manager', '2016-12-31'],
    "tou xiong" => ['Tou', 'Xiong', 'Software Engineer', '2016-12-31'],
    "michaela michaelson" => ['Michaela', 'Michaelson', 'District Manager', '2015-12-19'],
    "jake jacobson" => ['Jake', 'Jacobson', 'Programmer', 'N/A'],
    "jacquelyn jackson" => ['Jacquelyn', 'Jackson', 'DBA', 'N/A'],
    "sally weber" => ['Sally', 'Weber', 'Web Developer', '2015-12-18'],
  }

  def get_matching_results(input, records = DATA)
    no_results = []
    if find_matching_results(input, records) == no_results
      no_results
    else
      find_matching_results(input, records)
    end
  end

  private

  def find_matching_results(input, records)
    results = []
    records.select do |name, record|
      if name.include?(input.downcase)
        results.push(records[name])
      end
    end
    results.sort
  end
end
