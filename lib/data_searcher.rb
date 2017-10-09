class DataSearcher

  def get_matching_results(search_criteria, records)
    find_matching_results(search_criteria, records)
  end

  private

  def find_matching_results(search_criteria, records)
    input = search_criteria[:search_value]
    if search_criteria[:search_type] == 'name'
      matching_records = records.select do |record|
        full_name = record[:first_name] + record[:last_name]
        field_includes_input?(full_name, input)
      end
    else
      matching_records = records.select do |record|
        field_includes_input?(record[:role], input)
      end
    end
    matching_records.sort_by { |key, value| key[:first_name] }
  end

  def field_includes_input?(field, input)
    field.include?(input.downcase)
  end
end
