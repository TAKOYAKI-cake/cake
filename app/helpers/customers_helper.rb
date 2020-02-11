module CustomersHelper
	def log_in(customer)
    	session[:customer_id] = customer.id
	end
	def log_out
		session.delete(:customer_id)
		@customer = nil
	end
end
