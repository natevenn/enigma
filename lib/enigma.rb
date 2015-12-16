require_relative 'encryptor'
require_relative 'decryptor'
require_relative 'crack'

class Enigma

  def encrypt(message, key = nil, date = nil)
    Encryptor.new(message, key, date).encrypt
  end

  def decrypt(message, key = nil, date = nil)
    Decryptor.new(message).decrypt
  end

  def crack(message)
    Crack.new(message).crack
  end
end

class FileIO

  def file(filename = ARVG[0])
    File.read(filename)
  end

  def write_file
    File.write
  end
end
