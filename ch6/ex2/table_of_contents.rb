chapters = [
	{
		:title => "Getting Started",
		:page => 1
	},
	{
		:title => "Numbers",
		:page => 9
	},
	{
		:title => "Letters",
		:page => 13
	}
]

width = 64

puts("Table of Contents".center(width))
chapters.each_with_index { |chapter, index| puts(("Chapter " + (index + 1).to_s() + ". " + chapter[:title]).ljust(width/2) + ("page " + chapter[:page].to_s()).rjust(width/2)) }