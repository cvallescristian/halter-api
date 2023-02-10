class Cow < ApplicationRecord
  validates :collarId, uniqueness: true
  validates :cowNumber, uniqueness: true

  include Cow::SensorInformation

  def full_data 
    sensor_information = self.get_last_data()
    {
      "id" => id,
      "collarId" => collarId,
      "cowNumber" => cowNumber,
      "collarStatus" => sensor_information[:healthy] ? "Healthy": "Broken",
      "lastLocation" => {
        "lat" => sensor_information[:lat],
        "long" => sensor_information[:long]
      }
    }
  end

end
