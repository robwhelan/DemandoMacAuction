class Notifier < ActionMailer::Base
  default :from => "rob.whelan@deman.do",
          :return_path => "rob.whelan@deman.do"
          
  def winning_bid(buyer, seller)
  end
end
