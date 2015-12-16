require_relative 'encryptor'
class Decryptor

  attr_accessor :rotation, :message, :character_map

  def initialize(message)
    @message = message
    @rotation = NumberGenerator.new(52941, nil).rotation
    @character_map = Cipher.new.character_map.reverse
  end

  def decrypt
    decryption_index.map { |i| character_map[i] }.join
  end

  def index_message
    message.downcase.chars.map { |char| character_map.index(char) }
  end

  def rotation_multiplier
    index_message
    if message.length % 4 == 0
      m = message.length / 4
      rotation * m
    elsif message.length / 4 == 0
      r = message.length % 4
      rotation[0,r]
    else m = message.length / 4
      r = message.length % 4
      rotation * m + rotation[0,r]
    end
  end

  def decryption_index
    decrypted_index = rotation_multiplier.zip(index_message)
    decrypted_index.map do |nums|
      nums.reduce(:+) % 39
    end
  end

end
