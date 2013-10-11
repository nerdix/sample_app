xml.instruct!
xml.products do
	@products.each do |product|
		product_element(xml,product)
	end
end
