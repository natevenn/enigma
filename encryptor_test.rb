require 'Minitest/autorun'
require_relative 'encryptor'
require 'pry'

class EncryptorTest < Minitest::Test

  def test_message_characters_get_split_in_an_array
    enc = Encryptor.new('hello')

    assert_equal ['h', 'e', 'l', 'l', 'o'], enc.split_msg
  end

  def test_message_characters_get_downcased
    enc = Encryptor.new('HELLO')

    assert_equal ['h', 'e', 'l', 'l', 'o'], enc.split_msg
  end

  def test_can_index_cipher
    enc = Encryptor.new("hello")

    assert_equal [7, 4, 11, 11, 14], enc.index_message
  end

  def test_can_index_a_sentence
    enc = Encryptor.new("My name is Nathan")

    assert_equal [12, 24, 36, 13, 0, 12, 4, 36, 8, 18, 36, 13, 0, 19, 7, 0, 13], enc.index_message
  end

  def test_rotation_length_with_message_greater_than_four
    enc = Encryptor.new("hello")

    assert_equal [58, 31, 96, 46, 58], enc.rotation_multiplier
  end

  def test_rotaion_length_with_msg_less_than_4
    enc = Encryptor.new("hi")

    assert_equal [58, 31], enc.rotation_multiplier
  end

  def test_rotation_length_with_sentence
    enc = Encryptor.new("My name is Nathan")

    assert_equal [58, 31, 96, 46, 58, 31, 96, 46, 58, 31, 96, 46, 58, 31, 96, 46, 58], enc.rotation_multiplier
  end

  def test_can_zip_rotaion_array_with_message_array
    enc = Encryptor.new("hello")

    assert_equal [[58, 7], [31, 4], [96, 11], [46, 11], [58, 14]], enc.merge
  end

  def test_sum_of_zipping_rotaion_with_character_index
    enc = Encryptor.new("hello")

    assert_equal [26, 35, 29, 18, 33], enc.encrypt_index
  end

  def test_message_has_been_encrypted
    enc = Encryptor.new("hello")

    assert_equal ['0', '9', '3', 's', '7'], enc.encrypt
  end


end
