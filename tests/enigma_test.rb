require 'simplecov'
SimpleCov.start
require 'Minitest/autorun'
require_relative '../lib/enigma'
require 'pry'

class EnigmaTest < Minitest::Test

 def test_can_encrypt_text
   en = Enigma.new

   assert_equal '093s7', en.encrypt('hello..end..')
 end

 def test_can_decrypt_text
   en = Enigma.new

   assert_equal 'hello', en.decrypt('093s7')
 end

  def test_can_crack_text
    skip
    en = Enigma.new

    assert_equal 'hello', en.decrypt('093s7')
  end
end
