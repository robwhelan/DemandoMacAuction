class TransactionsController < ApplicationController

  load_and_authorize_resource
  before_filter :authenticate_user!
  

# consider this for a cart

def new
	
	@bid = Bid.find(params[:bid_id])
	@transaction = @bid.transactions.new

end

def create
#  @order = current_cart.build_order(params[:order])
#  @order.ip_address = request.remote_ip
@transaction = Transaction.find(params[:transaction])
   respond_to do |format|
      if @transaction.save
        format.html { render :action => "show", :notice => 'transaction was successfully created.' }
        format.json { render :json => @transaction, :status => :created, :location => @transaction }
      else
        format.html { render :action => "new" }
        format.json { render :json => @transaction.errors, :status => :unprocessable_entity }
      end
    end	

end

end