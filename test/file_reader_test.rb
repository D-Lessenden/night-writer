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
    filename = "message.txt"
    assert_equal "hello world", @reader.read(filename)
    #this passes when takes an argument, may need to alter
    #functionality 

  end

end
