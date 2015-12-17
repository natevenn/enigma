require 'simplecov'
SimpleCov.start
require 'Minitest/autorun'
require_relative '../lib/encryptor'
require 'pry'

class EncryptorTest < Minitest::Test


  def test_can_index_cipher
    enc = Encryptor.new("hello", 52941)

    assert_equal [7, 4, 11, 11, 14], enc.index_message
  end

  def test_can_index_a_sentence
    enc = Encryptor.new("My name is Nate", 52941)

    assert_equal [12, 24, 36, 13, 0, 12, 4, 36, 8, 18, 36, 13, 0, 19, 4], enc.index_message
  end

  def test_rotation_length_with_message_not_divisible_by_four
    enc = Encryptor.new("hello", 52941)

    assert_equal [58, 31, 96, 46, 58], enc.rotation_multiplier
  end

  def test_rotation_length_with_msg_less_than_4
    enc = Encryptor.new("hi", 52941)

    assert_equal [58, 31], enc.rotation_multiplier
  end

  def test_rotation_length_with_sentence
    enc = Encryptor.new("My name is Nathan", 52941)

    assert_equal [58, 31, 96, 46, 58, 31, 96, 46, 58, 31, 96, 46, 58, 31, 96, 46, 58], enc.rotation_multiplier
  end

  def test_sum_of_zipping_rotation_with_character_index
    enc = Encryptor.new("hello", 52941)

    assert_equal [26, 35, 29, 18, 33], enc.encryption_index
  end

  def test_message_has_been_encrypted
    enc = Encryptor.new("hello", 52941)

    assert_equal '093s7', enc.encrypt
  end
end
