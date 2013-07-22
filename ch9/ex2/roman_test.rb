require 'minitest/autorun'
require './Roman'

class TestRoman < MiniTest::Unit::TestCase
  def setup
	@roman = Roman.new
  end
  def test
  	#old
  	assert_equal "VIIII", @roman.old_convert(9)
  	assert_equal "MXII", @roman.old_convert(1012)
  	assert_equal "CI", @roman.old_convert(101)
  	assert_equal "X", @roman.old_convert(10)
  	assert_equal "I", @roman.old_convert(1)
  	assert_equal "DX", @roman.old_convert(510)
  	#new
  	assert_equal "IV", @roman.new_convert(4)
  	assert_equal "MCMLXXXIV", @roman.new_convert(1984)
  	assert_equal "CCXXVI", @roman.new_convert(226)
  	assert_equal "CMXCVIII", @roman.new_convert(998)
  end
end