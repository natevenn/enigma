require_relative 'number_generator'
require_relative 'cipher'

class Decryptor

  attr_reader :rotation, :message, :character_map

  def initialize(message, key = nil, date = nil)
    @message = message
    @rotation = NumberGenerator.new(key, date).rotation
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
