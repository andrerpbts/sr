class Setup < ActiveRecord::Base
  
  attr_accessible :max_banner_image, :max_vehicle_image
  
  def load_banner_image
    Setup.first
  end

  def load_vehicle_image
    Setup.first
  end
  
end
