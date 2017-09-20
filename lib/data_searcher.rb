class DataSearcher

  def get_matching_results(search_criteria, records)
    find_matching_results(search_criteria, records)
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
