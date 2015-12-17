require 'simplecov'
SimpleCov.start
require 'Minitest/autorun'
require_relative '../lib/decryptor'
require 'pry'

class DecryptorTest < Minitest::Test

  def test_can_index_cipher

    dec = Decryptor.new('093s7', 52941)

    assert_equal [12, 3, 9, 20, 5], dec.index_message
  end

  def test_sum_of_zipping_rotaion_with_character_index

    dec = Decryptor.new('093s7', 52941)

    assert_equal [31, 34, 27, 27, 24], dec.decryption_index
  end

  def test_rotation_length_with_message_not_divisible_by_four
    dec = Decryptor.new("hello", 52941)

    assert_equal [58, 31, 96, 46, 58], dec.rotation_multiplier
  end

  def test_rotation_length_with_msg_less_than_4
    dec = Decryptor.new("hi", 52941)

    assert_equal [58, 31], dec.rotation_multiplier
  end

  def test_rotation_length_with_sentence
    dec = Decryptor.new("My name is Nathan", 52941)

    assert_equal [58, 31, 96, 46, 58, 31, 96, 46, 58, 31, 96, 46, 58, 31, 96, 46, 58], dec.rotation_multiplier
  end

  def test_message_has_been_decrypted

    dec = Decryptor.new('093s7', 52941)

    assert_equal 'hello', dec.decrypt
  end

end
