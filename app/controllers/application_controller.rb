class ApplicationController < ActionController::Base
  protect_from_forgery

	after_filter :store_location

	def store_location
	  session[:previous_urls] ||= []
	  # store unique urls only
	  session[:previous_urls].prepend request.fullpath if session[:previous_urls].first != request.fullpath
	  session[:previous_urls].pop if session[:previous_urls].count > 2
	end

end
