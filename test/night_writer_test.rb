require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/night_writer'

class NightWriterTest < Minitest::Test

  def setup
    @nightwriter = NightWriter.new
  end

  def test_it_exists
    ARGV[0] = "message.txt"
    ARGV[1] = "braille.txt"
    assert_instance_of NightWriter, @nightwriter
  end

end
