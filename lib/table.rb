class Table

  def is_input_valid?(input)
    alphabet = ('a'..'z').to_a.join
    input.to_s.split('').all? do |character|
      alphabet.include?(character)
    end
  end

  def search_type_valid?(search_type)
    search_type.to_i > 0 && search_type.to_i <= 3
  end

  def get_user_intention(ui_instance)
    input = ui_instance.get_user_input
    until input == '1' || input == '2'
      ui_instance.ask_user_intention
      input = ui_instance.get_user_input
    end
    input
  end
end
