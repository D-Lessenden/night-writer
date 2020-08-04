require "./test/test_helper"
require 'pry'
require './lib/night_writer'
require './lib/file_reader'
require './lib/encode'


class FileReaderTest < Minitest::Test

  def setup
    @reader = FileReader.new
    @encode = Encode.new
    @nightwriter = NightWriter.new
  end

  def test_it_exists
    assert_instance_of FileReader, @reader
  end

  def test_it_reads_files
    ARGV[0] = "message.txt"
    assert_equal "hello world\n", @reader.read
  end

  def test_it_writes
    ARGV[0] = "write_test.txt"
    ARGV[1] = "write_test_braille.txt"
    plain = @reader.read.downcase.chomp
    braille = @nightwriter.encode(plain)
    @reader.write(braille)
    assert_equal ".00..0.0\n00.00.00\n0...0.0.", File.read("write_test_braille.txt")
  end


end
