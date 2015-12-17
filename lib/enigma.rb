require_relative 'encryptor'
require_relative 'decryptor'
require_relative 'cracker'

class Enigma

  def encrypt(message, key = nil, date = nil)
    Encryptor.new(message, key, date).encrypt
  end

  def decrypt(message, key = nil, date = nil)
    Decryptor.new(message, key, date).decrypt
  end

  def crack(message)
    Crack.new(message).crack
  end
end
