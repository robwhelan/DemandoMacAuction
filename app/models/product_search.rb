require 'google/api_client'

class ProductSearch < ActiveRecord::Base
  attr_accessible :keywords

  def show_images(keywords)
    client = Google::APIClient.new(:key => 'AIzaSyDhYGyD0GIGTZiDcKUkm-Aubs8RewHRqjQ', :authorization => nil)
    shopping = client.discovered_api("shopping", "v1")
    response = client.execute(
      :api_method => shopping.products.list,
      :parameters => {
        'q' => keywords,
        'key' => 'AIzaSyDhYGyD0GIGTZiDcKUkm-Aubs8RewHRqjQ',
        'source' => 'public',
        'country' => 'us',
      }
    )
    parsed_json = ActiveSupport::JSON.decode(response.body)
    i=0
    results_array=[{}]

    parsed_json["items"].each do |item|
      results_array[i]= { :image =>       item["product"]["images"][0]["link"],
                          :title =>       item["product"]["title"],
                          :brand =>       item["product"]["brand"],
                          :description => item["product"]["description"] }
      i=i+1

    end

    return results_array

  end

end
