require "./dragon"

pet = Dragon.new "Norbert"

while true
	print "? "
	case gets.chomp.downcase
		when "exit" then break
		when "feed" then pet.feed
		when "walk" then pet.walk
		when "bed" then pet.putToBed
		when "toss" then pet.toss
		when "rock" then pet.rock
		else puts "#{pet.name} doesn't understand that command."
	end
end
