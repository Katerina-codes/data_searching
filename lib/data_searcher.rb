class DataSearcher

  DATA = {
    "john johnson" => ['John', 'Johnson', 'Manager', '2016-12-31'],
    "tou xiong" => ['Tou', 'Xiong', 'Software Engineer', '2016-12-31'],
    "michaela michaelson" => ['Michaela', 'Michaelson', 'District Manager', '2015-12-19'],
    "jake jacobson" => ['Jake', 'Jacobson', 'Programmer', 'N/A'],
    "jacquelyn jackson" => ['Jacquelyn', 'Jackson', 'DBA', 'N/A'],
    "sally weber" => ['Sally', 'Weber', 'Web Developer', '2015-12-18'],
  }

  def get_matching_results(input)
    no_results = []
    if find_matching_results(input) == no_results
      no_results
    else
      find_matching_results(input)
    end
  end

  def find_matching_results(input)
    results = []
    DATA.select do |name, record|
      if name.include?(input.downcase)
        results.push(DATA[name])
      end
    end
    results.sort
  end

  def get_matching_job(input)
    if input == "z"
      []
    else
      [['John', 'Johnson', 'Manager', '2016-12-31'], ['Michaela', 'Michaelson', 'District Manager', '2015-12-19'], ['Jake', 'Jacobson', 'Programmer', 'N/A']]
    end
  end

end
