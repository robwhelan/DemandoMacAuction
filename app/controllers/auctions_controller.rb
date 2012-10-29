class AuctionsController < ApplicationController

  load_and_authorize_resource

  before_filter :authenticate_user!, :except => [:index, :show, :new]
  before_filter :attach_user, :only => [:create]
  
  def index
    if params[:q] || params[:auction_owner] || params[:category]
      @auctions = Auction.filter(params[:q], params[:auction_owner], params[:category]).all
    else
      @auctions = Auction.all
    end
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(params[:auction])
    
    respond_to do |format|
      if @auction.save
        format.html { render :action => "show", :notice => 'Auction was successfully created.' }
        format.json { render :json => @auction, :status => :created, :location => @auction }
      else
        format.html { render :action => "new" }
        format.json { render :json => @auction.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def show
    @auction = Auction.find(params[:id])
  end
  
  def edit
  	@auction = Auction.find(params[:id])
  end
  
  def update
  	@auction = Auction.find(params[:id])
  	
  	respond_to do |format|
  		if @auction.update_attributes(params[:auction])
  			format.html { redirect_to @auction, :notice => 'Sale was successfully updated.' }
  		else
  			format.html { render :action => 'edit' }
  		end
  	end
  end
  
  def destroy
  	@auction = Auction.find(params[:id])
  	@auction.destroy
  	
  	respond_to do |format|
  		format.html { redirect_to auctions_path }
  		format.json { head :no_content }
  	end
  end

  def attach_user
    params[:auction].merge!(:user_id => current_user.id)
  end
  
end
