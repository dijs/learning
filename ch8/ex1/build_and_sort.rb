words = []
while true
	input = gets.chomp
	if input.length == 0
		break
	else
		words.push input
	end
end
words = words.sort do |a,b| a.upcase <=> b.upcase end
words.each do |word| puts word end