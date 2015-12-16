require 'simplecov'
SimpleCov.start
require 'Minitest/autorun'
require_relative '../lib/crack'
require 'pry'

  class CrackTest < Minitest::Test


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

    def test_encrypted_text_in_forward_character_map
      cr = Crack.new('093s73ql68qf')

      assert_equal [5, 16, 34, 32, 11, 16, 29, 33, 18, 29, 35, 26], cr.forward_map
    end

    def test_indexes_are_merged
      cr = Crack.new('093s73ql68qf')

      assert_equal [37, 37, 3, 13, 4, 37, 37, 14, 11, 11, 4, 7], cr.cracked_index
    end

    def test_can_crack_encryption
      cr = Crack.new('093s73ql68qf')

      assert_equal 'hello..end..', cr.crack
    end
  end
