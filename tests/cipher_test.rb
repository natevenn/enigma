require 'Minitest/autorun'
require 'minitest/pride'
require_relative 'cipher'
require 'pry'

class CipherTest < Minitest::Test

  def test_characters_are_in_array

    cipher = Cipher.new

    assert_equal ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', ' ', '.', ','], cipher.char_generator
  end

  def test_characters_are_39_total

    cipher = Cipher.new

    assert_equal 39, cipher.count_chars
  end

end
