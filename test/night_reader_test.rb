require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/night_reader'
require './lib/file_reader'
#require './lib/encode'


class NightReaderTest < Minitest::Test


  def setup
    @nightreader = NightReader.new
  #  @encode = Encode.new
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


  # def test_it_can_encode_to_braille
  #   assert_equal "0.0.00\n..0...\n......", @nightwriter.encode("abc")
  #   assert_equal ".0\n00\n.0", @nightwriter.encode("w")
  # end
  #
  #
  # def test_can_convert_txt_file_to_braille
  #   ARGV[0] = "message.txt"
  #   ARGV[1] = "braille.txt"
  #   plain = "message.txt"
  #   braille = "braille.txt"
  #   expected = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0..."
  #   @nightwriter.encode_file_to_braille
  #   assert_equal expected, File.read("braille.txt")
  # end
  #
  # def test_can_convert_txt_file_to_wrap_braille
  #   ARGV[0] = "test_file.txt"
  #   ARGV[1] = "long_braille.txt"
  #   plain = "test_file.txt"
  #   braille = "long_braille.txt"
  #   @nightwriter.encode_file_to_braille
  #   assert_equal 1154, File.read("long_braille.txt").length
  #   #too long to test and format properly so I tested the length of the newly created document
  # end


end
#
# Using your existing Ruby program as a template,
# create a new program called NightReader
# that prints a confirmation message to the terminal
# that contains the name of the file that the user
# input as their second argument.
#
# Calculate the number of characters in the file provided
# as input and include that in the confirmation message.
#
# Create a dictionary that maps some representation of
# Braille characters to English characters.
#
# Convert a single Braille character contained in your
# input file into a single English character in your output file.
#
# Convert multiple Braille characters into multiple English characters.
#
# Convert a file containing multiple lines of Braille into English characters.
