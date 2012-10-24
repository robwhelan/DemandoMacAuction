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
  end
  
  def destroy
  end

  def attach_user
    params[:auction].merge!(:user_id => current_user.id)
  end
  
end
