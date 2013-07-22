class Roman	
	def convert(i)
		sym = {
			:M => 1000,
			:D => 500,
			:C => 100,
			:L => 50,
			:X => 10,
			:V => 5,
			:I => 1
		}
		s = ""
		t = i
		sym.each do |k, v|
			d = t / v
			t = t % v
			s += k.to_s * d
		end
		s
	end
end