require_relative 'encryptor'
class Decryptor

  attr_accessor :number_generator, :message, :cipher

  def initialize(message)
    @message = message
    @number_generator = NumberGenerator.new(nil, 52941).rotate
    @cipher = Cipher.new.char_map.reverse
  end

  def index_message
    cipher = @cipher
    split_msg = message.downcase.chars
    split_msg.map do |char|
    cipher.index(char)
    end
  end

  def rotation_multiplier
    message = index_message
    rotation = @number_generator
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

  def decrypt
    cipher = @cipher
    index = decryption_index
    decryption = index.map do |i|
      cipher[i]
    end
      decryption.join
  end
end
