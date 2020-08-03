require "./test/test_helper"
require 'pry'
require './lib/night_writer'
require './lib/file_reader'
require './lib/encode'


class NightWriterTest < Minitest::Test

  def setup
    @nightwriter = NightWriter.new
    @encode = Encode.new
  end

  def test_it_exists
    assert_instance_of NightWriter, @nightwriter
  end

  def test_file_length
    ARGV[0] = "message.txt"
    ARGV[1] = "braille.txt"
    assert_equal 11, File.read(ARGV[0]).chomp.length
  end

  def test_it_reads_files
    ARGV[0] = "message.txt"
    assert_equal "hello world", @nightwriter.read
  end

  def test_it_can_encode_to_braille
    assert_equal "0.0.00\n..0...\n......", @nightwriter.encode("abc")
    assert_equal ".0\n00\n.0", @nightwriter.encode("w")
  end


  def test_can_convert_txt_file_to_braille
    ARGV[0] = "message.txt"
    ARGV[1] = "braille.txt"
    @nightwriter.encode_file_to_braille
    expected = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0..."
    assert_equal expected, File.read("braille.txt")
  end

  def test_it_can_downcase_capitals_and_encode
    ARGV[0] = "capital.txt"
    ARGV[1] = "capital_braille.txt"
    @nightwriter.encode_file_to_braille
    expected = "000.00.0.00.0.\n....0.0.00..0.\n....0...0...0."
    assert_equal expected, File.read("capital_braille.txt")
  end

  def test_can_convert_txt_file_to_wrap_braille
    ARGV[0] = "super_long_message.txt"
    ARGV[1] = "super_long_braille.txt"
    @nightwriter.encode_file_to_braille
    expected =
"0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.
................................................................................................................................................................
................................................................................................................................................................
0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.
................................................................................................................................................................
................................................................................................................................................................
0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.
................................................................................................................................................................
................................................................................................................................................................
0.
0.
.."
    assert_equal expected, File.read("super_long_braille.txt")
    assert_equal 1457, File.read("super_long_braille.txt").length
  end

end
