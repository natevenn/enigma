require 'simplecov'
SimpleCov.start
require 'Minitest/autorun'
require_relative '../lib/decryptor'
require 'pry'

class DecryptorTest < Minitest::Test

  def test_message_characters_get_split_in_an_array
    skip
    enc = Decryptor.new('093s7')

    assert_equal ['0', '9', '3', 's', '7'], enc.split_msg
  end

  def test_message_characters_get_downcased
    skip

    enc = Decryptor.new('093S7')

    assert_equal ['0', '9', '3', 's', '7'], enc.split_msg
  end

  def test_can_index_cipher

    enc = Decryptor.new('093s7')

    assert_equal [12, 3, 9, 20, 5], enc.index_message
  end

  def test_can_zip_rotaion_array_with_message_array
    skip
    enc = Decryptor.new('093s7')

    assert_equal [[58, 12], [31, 3], [96, 9], [46, 20], [58, 5]], enc.merge
  end

  def test_sum_of_zipping_rotaion_with_character_index

    enc = Decryptor.new('093s7')

    assert_equal [31, 34, 27, 27, 24], enc.decryption_index
  end

  def test_message_has_been_encrypted

    enc = Decryptor.new('093s7')

    assert_equal 'hello', enc.decrypt
  end

end
