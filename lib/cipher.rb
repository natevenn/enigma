class Cipher

  def initialize
    @character_map = character_map
  end

  def character_map
    characters = ('a'..'z').to_a + ('0'..'9').to_a
    characters.push(' ', '.', ',')
  end
end
