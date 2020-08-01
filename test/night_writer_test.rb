require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
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

  def test_it_can_encode_to_braille
    assert_equal "0.0.00\n..0...\n......", @nightwriter.encode("abc")
  end

  def test_it_reads_files
    ARGV[0] = "message.txt"
    assert_equal "hello world\n", @nightwriter.read
  end

  def test_can_convert_txt_file_to_braille
    plain = "message.txt"
    expected = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0..."
    assert_equal expected, @nightwriter.encode_file_to_braille
  end





end
