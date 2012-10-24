class ProductSearchesController < ApplicationController
  
  def new
    @product_search = ProductSearch.new
  end

  def create
    @product_search = ProductSearch.new(params[:product_search])

    keywords = @product_search.keywords
    @results = @product_search.show_images(keywords)

    @auction = Auction.new

    respond_to do |format|
      if @product_search.save
        format.html { render :action => "show", :notice => 'Search was successfully created.' }
        format.json { render :json => @product_search, :status => :created, :location => @product_search }
      else
        format.html { render :action => "new" }
        format.json { render :json => @product_search.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @product_search = ProductSearch.find(params[:id])
  end

end