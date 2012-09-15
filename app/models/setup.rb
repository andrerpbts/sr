class Setup < ActiveRecord::Base
  
  def max_banner_image
    Setup.first
  end

  def max_vehicle_image
    Setup.first
  end
  
end
