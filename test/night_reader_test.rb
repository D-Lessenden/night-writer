require "./test/test_helper"
require 'pry'
require './lib/night_reader'
require './lib/file_reader'
require './lib/reverse_encode'


class NightReaderTest < Minitest::Test


  def setup
    @nightreader = NightReader.new
    @encode = ReverseEncode
  end

  def test_it_exists
    assert_instance_of NightReader, @nightreader
  end

  def test_file_length
    ARGV[0] = "braille.txt"
    ARGV[1] = "message.txt"
    assert_equal 68, File.read(ARGV[0]).length
  end

  def test_it_reads_files
    ARGV[0] = "braille.txt"
    expected = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0..."
    assert_equal expected, @nightreader.read
  end

  def test_it_can_encode_to_english
    assert_equal "w", @nightreader.encode(".0\n00\n.0")
    assert_equal "abc", @nightreader.encode("0.0.00\n..0...\n......")
    assert_equal "qwerty", @nightreader.encode("00.00.0..000\n0000.00000.0\n0..0..0.0.00")
  end


  def test_can_translate_from_txt_file
    ARGV[0] = "braille.txt"
    ARGV[1] = "original.txt"
    @nightreader.encode_file_to_english
    assert_equal "hello world", File.read("original.txt")
  end

  def test_it_can_translate_a_needlessly_long_file
    ARGV[0] = "long_braille.txt"
    ARGV[1] = "long_message.txt"
    @nightreader.encode_file_to_english
    assert_equal "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab", File.read("long_message.txt")
  end

  def test_another_needlessly_long_test
    ARGV[0] = "super_long_braille.txt"
    ARGV[1] = "super_long_message.txt"
    @nightreader.encode_file_to_english
    assert_equal "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab", File.read("super_long_message.txt")
  end

end
