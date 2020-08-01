require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/night_writer'
require './lib/file_reader'


class FileReaderTest < Minitest::Test

  def setup
    @reader = FileReader.new
  end

  def test_it_exists
    assert_instance_of FileReader, @reader
  end

  def test_it_reads_files
    ARGV[0] = "message.txt"
    assert_equal "hello world\n", @reader.read
    #this passes (well, there is a ghost \n)
    #when takes an argument, may need to alter
    #for functionality
  end

end
