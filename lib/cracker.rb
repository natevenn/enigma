require_relative 'encryptor'
require_relative 'decryptor'
require_relative 'cipher'
require 'pry'

class Crack

  attr_reader :number_generator, :message, :character_map

  def initialize(message, date = nil)
    @message = message
    @number_generator = NumberGenerator.new(nil, 52941).rotation
    @character_map = Cipher.new.character_map
  end

  def crack
    cracked_index.map { |i| character_map[i] }.join.reverse
  end

  def index_message
    message.reverse.downcase.chars.map { |character| character_map.reverse.index(character) }
  end

  def crack_rotation
    message = index_message
    cracker = []
    a = (message[0] - 1) % 39
    b = (message[1] - 1) % 39
    c = (message[2] - 35) % 39
    d = (message[3] - 25) % 39
    cracker.push(a, b, c, d)
  end

    def rotation_multiplier
      rotation = crack_rotation
      if message.length % 4 == 0
        rotation * (message.length / 4)
      elsif message.length / 4 == 0
        rotation[0, message.length % 4]
      else
        rotation * (message.length / 4) + rotation[0, message.length % 4]
      end
    end

    def forward_map
      message.reverse.downcase.chars.map { |character| character_map.index(character) }
     end

    def cracked_index
      encrypted_index = rotation_multiplier.zip(forward_map)
      encrypted_index.map do |nums|
        nums.reduce(:+) % 39
      end
    end
  end
