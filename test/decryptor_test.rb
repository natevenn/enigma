require 'simplecov'
SimpleCov.start
require 'Minitest/autorun'
require_relative '../lib/decryptor'
require 'pry'

class DecryptorTest < Minitest::Test

  def test_can_index_cipher

    enc = Decryptor.new('093s7')

    assert_equal [12, 3, 9, 20, 5], enc.index_message
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
