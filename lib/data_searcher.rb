class DataSearcher

  def initialize(input = $stdin)
    @input = input
  end

  def get_word
    @input.gets.chomp	
  end

end
