class User < ActiveRecord::Base

  ROLES 	= %w[admin seller buyer]
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, 
  					:user_name, :first_name, :last_name, :role, :category,
  					:address_line1, :address_line2, :city, :state, :zip, :phone

  has_many :auctions
  has_many :bids
  has_many :delayed_buyers

end
