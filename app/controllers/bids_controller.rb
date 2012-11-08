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
	if user_signed_in?
	  	if able_to_bid(current_user.id)
		    @auction = Auction.find(params[:bid][:auction_id])
		    @bid = @auction.bids.new(params[:bid])
    puts "before respond_to"
		    respond_to do |format|
		      if @bid.save and @bid.is_winning
		        format.html { redirect_to new_bid_transaction_path(@bid), :notice => 'Your bid won!' }
		        format.json { render :json => @bid, :status => :created, :location => @bid }
		      else
 		       format.html { render :action => "new", :notice => "either bid did not save or bid is not winning" }
		        format.json { render :json => @bid.errors, :status => :unprocessable_entity }
		      end
	puts "after respond_to"
		    end #end respond_to
		else # if the user is NOT able to bid,
			redirect_to auctions_path, :notice => 'You are not yet able to make another bid on this product!'
		end # end able-to-bid logic
	else # if the user is NOT signed in,
		redirect_to new_user_session_path, :notice => 'Please sign in before making a bid.'
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
  
  def able_to_bid(user)
  	delay = @bid.auction.delayed_buyers.where(:user_id => user).last
  	
  	if delay.nil?
  		return true
  	elsif 0.minutes.from_now >= delay.unlock_time
  		return true
  	elsif 0.minutes.from_now < delay.unlock_time
  		return false
  	end
  end
 
end
