require_relative 'encryptor'
require_relative 'decryptor'
require_relative 'cipher'
require 'pry'

class Crack

  attr_reader :number_generator, :message, :cipher

  def initialize(message)
    @message = message
    @number_generator = NumberGenerator.new(nil, 52941).rotate
    @cipher = Cipher.new.character_map.reverse
  end

  def index_message
    cipher = @cipher
    split_msg = message.downcase.chars.reverse
    split_msg.map do |char|
    cipher.index(char)
    end
  end

  def crack_rotation
    message = index_message
    cracker = []
    a = message[0] - 1
    cracker << (a % 39)
      b = message[1] - 1
      cracker << (b % 39)
        c = message[2] - 35
        cracker << (c % 39)
          d = message[3] - 25
          cracker << (d % 39)
  end


    def rotation_multiplier(rotation = crack_rotation)
      if message.length % 4 == 0
        rotator = rotation * (message.length / 4)
      elsif message.length / 4 == 0
        rotator = rotation[0, message.length % 4]
      else
        rotator = rotation * (message.length / 4) + rotation[0, message.length % 4]
      end
      rotator
    end

    def forward_map
      cipher = @cipher.reverse
      index_msg = index_message
      index_msg.map do |character|
      cipher.index(character)
      end
     end

    def merge
      rotation_multiplier.zip(forward_map)
    end

    def decryption_index
      encrypted_index = merge
      encrypted_index.map do |nums|
        nums.reduce(:+) % 39
      end
    end
  end
