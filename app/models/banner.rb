class Banner < ActiveRecord::Base

  has_many :sponsors, :dependent => :destroy
  
  attr_accessible :banner, :height, :left, :top, :category, :width, :sponsors_attributes
  attr_accessor :category

  accepts_nested_attributes_for :sponsors, :allow_destroy => true
  
  BANNER_CATEGORIES = {
    "(B1) Superior - 720x100"       => "A1",
    "(B2) Lat. direito - 270x350"   => 2,
    "(B3) Lat. direito - 270x150"   => 3,
    "(B4) Lat. direito - 270x350"   => 4,
    "(B5) Inferior - 200x80"        => 5,
    "(B6) Inferior - 200x80"        => 6,
    "(B7) Inferior - 200x80"        => 7,
    "(B8) Inferior - 200x80"        => 8,
    "(P1) Personalizado - ???x???"  => 9
  }

end
