class PagesController < ApplicationController

  def home
  end

  def about
  end

  def faq
  end
  
  def how_it_works_buyers
  	render 'how_it_works_buyers'
  end
  
  def how_it_works_sellers
  	render 'how_it_works_sellers'
  end

end