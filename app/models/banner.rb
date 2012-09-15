class Banner < ActiveRecord::Base
  has_many :sponsors, :dependent => :destroy
  
  attr_accessible :banner, :height, :left, :top, :category, :width, :sponsors_attributes

  accepts_nested_attributes_for :sponsors, :allow_destroy => true
  
  BANNER_CATEGORIES  = ["(01) Superior - 720x100", "(02) Lat. direito - 270x350", "(03) Lat. direito - 270x150",
                        "(04) Lat. direito - 270x350", "(05) Inferior - 200x80", "(06) Inferior - 200x80",
                        "(07) Inferior - 200x80", "(08) Inferior - 200x80", "(P1) Personalizado - ???x???"]
  
end
