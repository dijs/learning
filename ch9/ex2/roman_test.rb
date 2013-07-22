require 'minitest/autorun'
require './Roman'

class TestRoman < MiniTest::Unit::TestCase
  def setup
	@roman = Roman.new
  end
  def test
  	#old
  	assert_equal "VIIII", @roman.convert(9)
  	assert_equal "MXII", @roman.convert(1012)
  	assert_equal "CI", @roman.convert(101)
  	assert_equal "X", @roman.convert(10)
  	assert_equal "I", @roman.convert(1)
  	assert_equal "DX", @roman.convert(510)
  	#new
  	assert_equal "IV", @roman.new_convert(4)
  	assert_equal "MCMLXXXIV", @roman.new_convert(1984)
  	assert_equal "CCXXVI", @roman.new_convert(226)
  	assert_equal "CMXCVIII", @roman.new_convert(998)
  end
end