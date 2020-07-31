require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/encode'

class NightWriterTest < Minitest::Test
  def setup
    @encode = Encode.new
  end

  def test_it_exists
    assert_instance_of Encode, @encode
  end

  def test_encode
    skip
    assert_equal ["0.", "..", ".."], @encode.encode_to_braille("a")
    assert_equal [["0.", "..", ".."], ["0.", "0.", ".."], ["00", "..", ".."]], @encode.encode_to_braille("abc")
    assert_equal [["0.", "..", ".."], ["..", "..", ".."], ["0.", "..", ".."]], @encode.encode_to_braille("a a")
  end

  def test_print_braille
    result =
    "0.
    ..
    .."
    assert_equal result, @encode.encode_to_braille("a")
  end
end
