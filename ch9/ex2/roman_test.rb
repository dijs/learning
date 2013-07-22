require 'minitest/autorun'
require './Roman'

class TestRoman < MiniTest::Unit::TestCase
  def setup
	@roman = Roman.new
  end
  def test
  	assert_equal "VIIII", @roman.convert(9)
  	assert_equal "MXII", @roman.convert(1012)
  	assert_equal "CI", @roman.convert(101)
  	assert_equal "X", @roman.convert(10)
  	assert_equal "I", @roman.convert(1)
  	assert_equal "DX", @roman.convert(510)
  end
end