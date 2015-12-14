class Cipher

  attr_reader :char_map
  def initialize
    @char_map = character_map
  end

  def character_map
    characters = ('a'..'z').to_a + ('0'..'9').to_a
    characters.push(' ', '.', ',')
  end
end

  # def count_chars
  #   char_generator
  #   characters = @char_map
  #   total = characters.count do |character|
  #     character
  #   end
  #   total
  # end
