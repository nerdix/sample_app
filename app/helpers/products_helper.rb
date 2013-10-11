module ProductsHelper

	def product_element(xml,product)
		xml.product do
			xml.aid product.id
			xml.name product.title
			xml.desc raw(product.description)
			xml.price product.price
			xml.link product.url
			xml.brand product.vendor
#			xml.ean product.ean
			xml.shop_cat product.category
			xml.image product.featured_image_url
		end
	end
end
