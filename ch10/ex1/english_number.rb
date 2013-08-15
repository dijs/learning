class EnglishNumber

	@@ones = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
	@@tens = ["ten", "twenty", "thirty", "fourty", "fifty", "sixty", "seventy", "eighty", "ninety"] 
	@@teens = ["eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
	@@bigs = ["trillion","billion","million","thousand"]

	def self.parse n
		if n < 10
			@@ones[n - 1]
		elsif n > 10 && n < 20
			@@teens[n - 11]
		else
			if n < 100
				d = n / 10
				m = n % 10
				pre = @@tens[d - 1]
				return m == 0 ? pre : pre + " " + parse(m)
			elsif n > 100 && n < 1000
				d = n / 100
				m = n % 100
				pre = parse(d) + " hundred" 
				return m == 0 ? pre : pre + " and " + parse(m)
			else
				i = 0
				while i < @@bigs.length
					val = 10 ** ((@@bigs.length - i) * 3)
					d = n / val
					if d > 0
						m = n % val
						pre = parse(d) + " " + @@bigs[i]
						return m == 0 ? pre : pre + " and " + parse(m)
					end						
					i = i + 1
				end 
			end
		end
	end

end

puts EnglishNumber.parse ARGV[0].to_i