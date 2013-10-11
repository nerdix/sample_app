class ProductsController < ApplicationController
	before_filter :restrict_access,:only=>[:export,:export_all]
	
	def export
		#activate session
		VersacommerceAPI::Base.activate_session(@session)
		#fetch all products
		@products = VersacommerceAPI::Product.find(:all, params: {include: :variants})
		stream = render_to_string(:template=>"products/export" )  
		send_data(stream, :type=>"text/xml",:filename => "products-#{Time.now}.xml")
	end

	def export_all
		#activate session
		VersacommerceAPI::Base.activate_session(@session)
		#fetch all products
		@products = VersacommerceAPI::Product.find(:all, params: {include: :variants})
		send_data @products.to_xml,:type => 'text/xml; charset=UTF-8;',:disposition => "attachment; filename=products-#{Time.now}.xml"
	end

	private

	def restrict_access
		api_key = ENV['VERSACOMMERCE_API_KEY']
		secret =  ENV['VERSACOMMERCE_SECRET_KEY']
		token =   ENV['VERSACOMMERCE_TOKEN']
		domain =  ENV['VERSACOMMERCE_DOMAIN'].dup
		begin 
			#setup api key and secret
			VersacommerceAPI::Session.setup(api_key: api_key, secret: secret) if api_key.present? and secret.present?
			#create session
			@session  = VersacommerceAPI::Session.new(domain, token)	if token.present? and domain.present?

			if !(@session.present? and @session.valid?)
				redirect_to root_path ,notice: "Unable to connect store."		
			end
		rescue
			redirect_to root_path ,notice: "Unable to connect store."		
		end
	end


end
