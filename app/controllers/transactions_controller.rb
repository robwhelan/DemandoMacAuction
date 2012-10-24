class TransactionsController < ApplicationController

  load_and_authorize_resource
  before_filter :authenticate_user!
  
end


# consider this for a cart
def create
  @order = current_cart.build_order(params[:order])
  @order.ip_address = request.remote_ip
  if @order.save
    if @order.purchase
      render :action => "success"
    else
      render :action => "failure"
    end
  else
    render :action => 'new'
  end
end

