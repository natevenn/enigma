require 'simplecov'
SimpleCov.start
require 'Minitest/autorun'
require_relative '../lib/crack'
require 'pry'

  class CrackTest < Minitest::Test

    def test_message_is_split_into_an_array
      skip
      cr = Crack.new('093s73ql68qf')

      assert_equal ["f", "q", "8", "6", "l", "q", "3", "7", "s", "3", "9", "0"], cr.split_msg
    end

    def test_message_gets_indexed_against_cipher_in_reverse_map
      cr = Crack.new('093s73ql68qf')

      assert_equal [33, 22, 4, 6, 27, 22, 9, 5, 20, 9, 3, 12], cr.index_message
    end

    def test_sub_index_of_encrypted_with_word_end
      cr = Crack.new('093s73ql68qf')

      assert_equal [32, 21, 8, 20], cr.crack_rotation
    end

    def test_cracker_rotation_length_same_as_message_length
      cr = Crack.new('093s73ql68qf')

      assert_equal [32, 21, 8, 20, 32, 21, 8, 20, 32, 21, 8, 20], cr.rotation_multiplier
    end

    def test_encrypted_text_in_forward_cipher_map
      cr = Crack.new('093s73ql68qf')

      assert_equal [5, 16, 34, 32, 11, 16, 29, 33, 18, 29, 35, 26], cr.forward_map
    end

    def test_indexes_are_merged
      cr = Crack.new('093s73ql68qf')

      assert_equal [[32, 5], [21, 16], [8, 34], [20, 32], [32, 11], [21, 16], [8, 29], [20, 33], [32, 18], [21, 29], [8, 35], [20, 26]], cr.merge
    end
  end
