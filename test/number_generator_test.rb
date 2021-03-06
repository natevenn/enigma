require 'Minitest/autorun'
require 'minitest/pride'
require_relative '../lib/number_generator'
require 'pry'
class KeyGeneratorTest < Minitest::Test

  def test_can_return_a_four_digit_input
    kg = NumberGenerator.new

    assert_equal ['6', '2', '2', '5'], kg.generate_offset
  end

  def test_can_return_default_date_with_offset
    kg = NumberGenerator.new

    assert_equal ['8', '4', '0', '0'], kg.generate_offset(140780)
  end

  def test_can_return_default_key
    kg = NumberGenerator.new

    assert_equal ['5', '2', '9', '4', '1'], kg.generate_key(52941)
  end

  def test_can_add_key_and_offset
    kg = NumberGenerator.new(52941, nil)

    assert_equal [58, 31, 96, 46], kg.rotation
  end


end
