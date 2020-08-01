require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/night_writer'
require './lib/file_reader'
require './lib/encode'


class NightWriterTest < Minitest::Test

  # def test_it_can_read_files 
  #   read = FileReader.new
  #   filename = message.txt
  #   assert_equal "hello", read.read 
  # end #this now lives in the file_read_test

  def setup
    @nightwriter = NightWriter.new
    @encode = Encode.new
  end

  def test_it_exists
    assert_instance_of NightWriter, @nightwriter
  end

  def test_it_can_encode
    assert_equal "0.0.00\n..0...\n......", @nightwriter.encode("abc")
  end





end
