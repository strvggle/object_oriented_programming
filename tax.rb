#TAXES AND RECEIPTS SETUP

class Receipt
	sales = 0.10
	import = 0.05
	def initialize
		@item = []
	end

#ADD ITEMS

	def add_item(name, amount, price, exempt, imported)
		@items.push(name: name, amount: amount, price: price, exempt: exempt, imported: imported)
	end

#ROUNDING
	def rounding(tax)
		x=((tax * 10 ) % 1).round(1)
		if x < 0.5 && x > 0
			(tax.round(1) + 0.05).round(2)
		elsif x > 0.5 && x <= 1
			tax.round(1)
		elsif x == 0.5
			tax.round(2)
		else
			tax.round(1)
		end
	end

#RECEIPT
	def printreceipt
		taxes = 0
		total = 0
		puts "Receipt:"
		@item.each do |item|
			import = item[:imported] ? rounding(item[:price] * import)
			sales = !item[:exempt] ? rounding(item[:price] * sales)
 	 		item_price = item[:price] + import + sales


		end
	end
end
