require_relative 'encryptor'
require_relative 'decryptor'
require_relative 'crack'

class Enigma

  def encrypt(message, key = nil, date = nil)
    Encryptor.new(message, key, date).encrypt
  end

  def decrypt(message, key, date = Date.today)
    dec = Decryptor.new(message)
    dec.decrypt
  end

  def crack(message)
    cracker = Crack.new(message)
    cracker.crack
  end
end
