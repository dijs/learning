while true
	input = gets.chomp
	if input == "BYE"
		break
	elsif input == input.upcase
		puts("NO, NOT SINCE " + (1930 + rand(20)).to_s())
	else
		puts("HUH?!  SPEAK UP, SONNY!")
	end
end