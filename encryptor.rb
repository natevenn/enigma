require_relative 'number_generator'
require_relative 'cipher'
require 'pry'
class Encryptor

  attr_accessor :number_generator, :message, :cipher, :msg_map

  def initialize(message)
    @message = message
    @number_generator = NumberGenerator.new(nil, 52941).rotation
    @cipher = Cipher.new.char_map
    @msg_map = msg_map
  end

  def split_msg
    @message = message.downcase.chars
  end

  def index_message
    cipher = @cipher
    message = split_msg
    msg_map = message.map do |char|
    cipher.index(char)
    end
    @msg_map = msg_map
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

  def merge
    rotation_multiplier.zip(msg_map)
  end

  def encrypt_index
    encrypted_index = merge
    encrypted_index.map do |nums|
      nums.reduce(:+) % 39
    end
  end

  def encrypt
    cipher = @cipher
    index = encrypt_index
    index.map do |i|
      cipher[i]
    end
  end






end
