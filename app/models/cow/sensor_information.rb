module Cow::SensorInformation


  def get_last_data 
    response = HTTParty.get("https://5d96585ca824b400141d26b2.mockapi.io/halter/device/#{self.collarId}/status")
    if response.code == 200
      statuses = JSON.parse(response.body, expires_in: 5.minutes)
      
      last_data = statuses.select{|s| s["serialNumber"] == self.collarId}.max_by{|s| s["timestamp"]}
      
      if last_data.nil?
        return default_data
      end

      return {:lat => last_data["lat"], :long => last_data["lng"], :healthy => last_data["healthy"]}
    else
      return default_data
    end
    
  end

  def default_data
    {:lat => nil, :long => nil, :healthy => false}
  end
end