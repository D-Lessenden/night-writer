require "./test/test_helper"
require 'pry'
require './lib/reverse_encode'
require './lib/file_reader'


class ReverseEncodeTest < Minitest::Test
  def setup
    @encode = ReverseEncode.new
  end

  def test_it_exists
    assert_instance_of ReverseEncode, @encode
  end

  def test_can_invert_dictionary
    assert_equal "a", @encode.invert[["0.", "..", ".."]]
    assert_equal "q", @encode.invert[["00", "00", "0."]]
    assert_equal 27, @encode.invert.keys.count
  end

  def test_translate_one_letter_to_english
    assert_equal "a", @encode.one_letter_trans("0.\n..\n..")
    assert_equal "b", @encode.one_letter_trans("0.\n0.\n..")
    assert_equal "c", @encode.one_letter_trans("00\n..\n..")
  end

  def test_it_can_translate_more_than_one_letter
    assert_equal "abc", @encode.long_translate("0.0.00\n..0...\n......")
    assert_equal "qwerty", @encode.long_translate("00.00.0..000\n0000.00000.0\n0..0..0.0.00")
  end

  def test_new_method_housing_helper_functions
    assert_equal "qwerty", @encode.long_translate("00.00.0..000\n0000.00000.0\n0..0..0.0.00")
    assert_equal "a", @encode.wrap_translate("0.\n..\n..")
    assert_equal "qwerty", @encode.wrap_translate("00.00.0..000\n0000.00000.0\n0..0..0.0.00")
  end

  def test_it_can_handle_the_super_long_files
    ARGV[0] = "super_long_braille.txt"
    ARGV[1] = "super_long_message.txt"
    @encode.wrap_translate(ARGV[1])
    expected = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab"
    assert_equal expected, File.read("super_long_original.txt")
  end
end
