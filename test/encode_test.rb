require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/encode'

class NightWriterTest < Minitest::Test
  def setup
    @encode = Encode.new
  end

  def test_it_exists
    assert_instance_of Encode, @encode
  end

  def test_encode
    skip
    assert_equal [["0.", "..", ".."]], @encode.encode_to_braille("a")
    assert_equal [["0.", "..", ".."], ["0.", "0.", ".."], ["00", "..", ".."]], @encode.encode_to_braille("abc")
    assert_equal [["0.", "..", ".."], ["..", "..", ".."], ["0.", "..", ".."]], @encode.encode_to_braille("a a")
  end

  def test_one_letter_encode
    skip
    assert_equal [["0.", ".0", "00"]], @encode.encode_to_braille("z")
  end

  def test_long_encode
    skip
    assert_equal [["00", "..", "00"], ["00", ".0", "00"], ["0.", ".0", "00"]], @encode.long_encode("xyz")
  end

  def test_print_braille_one_letter
    skip
    result = "0.\n..\n.."
   assert_equal result, @encode.encode_to_braille("a")
  end

  def test_print_braille_multi_letter
    expected = "00000.\n...0.0\n000000"
    assert_equal expected, @encode.long_encode("xyz")
  end
end
