class Roman	
	@@oldSym = {
		:M => 1000,
		:D => 500,
		:C => 100,
		:L => 50,
		:X => 10,
		:V => 5,
		:I => 1
	}
	@@newSym = {
		:M => 1000,
		:CM => 900,
		:D => 500,
		:CD => 400,
		:C => 100,
		:XC => 90,
		:L => 50,
		:XL => 40,
		:X => 10,
		:IX => 9,
		:V => 5,
		:IV => 4,
		:I => 1
	}
	def gconvert(sym, i)
		sym.inject("") do |s, (k, v)|
			d = i / v
			i = i % v
			s += k.to_s * d
		end
	end
	def old_convert(i)
		gconvert @@oldSym, i
	end
	def new_convert(i)
		gconvert @@newSym, i
	end
end