require 'simplecov'
SimpleCov.start
require 'Minitest/autorun'
require_relative '../lib/enigma'
require 'pry'

class EnigmaTest < Minitest::Test

 def test_can_encrypt_text_with_key
   en = Enigma.new

   assert_equal ',,0zqa e,,wer3wuw3q', en.encrypt('this is the ..end..', 52941)
 end

 def test_can_decrypt_text
   en = Enigma.new

   assert_equal 'this is the ..end..', en.decrypt(',,0zqa e,,wer3wuw3q', 52941)
 end

  def test_can_crack_text
    en = Enigma.new

    assert_equal 'this is the ..end..', en.crack(',,0zqa e,,wer3wuw3q')
  end
end
