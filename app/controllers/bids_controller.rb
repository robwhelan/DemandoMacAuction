class BidsController < ApplicationController
  
  load_and_authorize_resource  
  before_filter :authenticate_user!
  before_filter :attach_user, :only => [:create]

  def index
    if current_user.role == "admin"
      @bids = Bid.all
    else
      @bids = Bid.where(:user_id => current_user.id)
    end
  end

  def new
    @auction = Auction.find(params[:auction_id])
    @bid = @auction.bids.new
  end

  def create
    @auction = Auction.find(params[:auction_id])
    @bid = @auction.bids.new(params[:bid])
    
    respond_to do |format|
      if @bid.save and @bid.value >= @auction.lowest_accepted_price
        format.html { redirect_to transaction_path( :id => @bid.transaction.id , :notice => 'Your bid won!' )}
        format.json { render :json => @bid, :status => :created, :location => @bid }
      else
        format.html { render :action => "new" }
        format.json { render :json => @bid.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @bid = Bid.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def attach_user
    params[:bid].merge!(:user_id => current_user.id)
  end
 
end
