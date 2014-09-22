module SessionsHelper
# CR - remove - is now duplicating application controller
	def current_user
		@current_user = User.find(session[:user_id])
	end


end
