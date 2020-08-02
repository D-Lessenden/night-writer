require "./test/test_helper"
require 'pry'
require './lib/encode'
require './lib/file_reader'

class EncodeTest < Minitest::Test
  def setup
    @encode = Encode.new
  end

  def test_it_exists
    assert_instance_of Encode, @encode
  end

  def test_encode
    skip #artifact from before I could fully convert to braille
    assert_equal [["0.", "..", ".."]], @encode.encode_to_braille("a")
    assert_equal [["0.", "..", ".."], ["0.", "0.", ".."], ["00", "..", ".."]], @encode.encode_to_braille("abc")
    assert_equal [["0.", "..", ".."], ["..", "..", ".."], ["0.", "..", ".."]], @encode.encode_to_braille("a a")
  end

  def test_one_letter_encode
    skip #artifact from before I could fully convert to braille
    assert_equal [["0.", ".0", "00"]], @encode.encode_to_braille("z")
  end

  def test_long_encode
    skip #artifact from before I could fully convert to braille
    assert_equal [["00", "..", "00"], ["00", ".0", "00"], ["0.", ".0", "00"]], @encode.long_encode("xyz")
  end

  def test_print_braille_one_letter
     result = "0.\n..\n.."
     assert_equal result, @encode.one_letter_encode("a")
     result = "0.\n0.\n00"
     assert_equal result, @encode.one_letter_encode("v")
  end

  def test_print_braille_multi_letter
    expected = "00000.\n...0.0\n000000"
    assert_equal expected, @encode.long_encode("xyz")
    expected = ".00.0.00\n00.0.0.0\n.0....0."
    assert_equal expected, @encode.long_encode("ween")
  end

  def test_one_letter_thru_encode_to_braille
    assert_equal ".0\n00\n0.", @encode.encode_to_braille("t")
  end

  def test_long_encode_thru_encode_to_braille
    assert_equal "00.00.0..000\n0000.00000.0\n0..0..0.0.00", @encode.encode_to_braille("qwerty")
  end

  def test_can_convert_txt_file_to_wrap_braille
    ARGV[0] = "test_file.txt"
    ARGV[1] = "long_braille.txt"
    plain = "test_file.txt"
    braille = "long_braille.txt"
    @encode.encode_to_braille_wrap("long_braille.txt")
    expected =
    ".000...00..0.0...00..0.0.00000..0.00.0.00....0..0.0.0.000...0.00..0.0.0..00.0..0..000..000.0...00.0..0...0..0.00..0.0.0.0....00.0...0.000.0.00.0..0.00..0..0000.
0.....00..0.00..00000.000..000.....0000.0...0...00.0....00.....0...00.0.0..0..0...0..00..000..0000..00..0..........00..000..0000.0.......0...000...00...0.0..0.0
..0.....000.0....00...0...0.....000.0...0.......0.............0...0...00..0.000...0.0...0.0...0.....0.........0...0.00..0...0.........0.0.000.0...0.....0...0...
.0..0.0.000..00.0.00...00...000..0..0..0..0.0.0..0.0..0.000...000..0..0..0000...0.0.0.0...0.0.0.0...0.0.0.0...0.0.0.0...0.0.0.0...0.0.0.0...0.0.0.0...0.0.0.0...
0...00.000..0.00.0.0..00.0..00.000....00..0..0..0.00...0.0.0...0.000..0.0..0.0..0.0...00..0.0...00..0.0...00..0.0...00..0.0...00..0.0...00..0.0...00..0.0...00..
0...0...0.00..0.......0.0.......0.....0...0.....0.0...0.0.....0....0..0...0.......0.........0.........0.........0.........0.........0.........0.........0.......
0.0.0.0...0.0.0.0...0.0.0.0...0.0.0.0...0.0.0.0...0.0.0.0.....
0.0...00..0.0...00..0.0...00..0.0...00..0.0...00..0.0...00....
..0.........0.........0.........0.........0.........0........."
    assert_equal expected, File.read("long_braille.txt")
    assert_equal 1154, File.read("long_braille.txt").length
  end
end
