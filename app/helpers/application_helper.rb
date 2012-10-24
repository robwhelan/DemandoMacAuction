module ApplicationHelper

	
	def product_category
  		product_category = %w[appliances arts_and_crafts automotive beauty baby books cell_phones_and_Accessories
  					clothing_and_accessories collectibles electronics gift_cards grocery health
  					home_and_kitchen jewelry music office_products lawn_and_garden pets shoes 
  					sports_and_outdoors tools_and_home_improvement toys_and_games video_games watches]
	end

  def logo
    logo = image_tag("demando_logo.png", :alt => "Demando")
  end
  
  def mini_logo
    mini_logo = image_tag("mini_demando_logo.png", :alt => "Demando")
  end

  def title
    base_title = "Demando"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def try_this
    return "hello"
  end

end