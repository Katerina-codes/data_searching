class Table

  def is_input_valid?(input)
    alphabet = ("a".."z").to_a.join
    input.to_s.split("").all? do |character|
      alphabet.include?(character)
    end
  end

  def search_type_valid?(search_type)
    search_type == 1 || search_type == 2
  end
end
