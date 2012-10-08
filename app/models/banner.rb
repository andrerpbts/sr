class Banner < ActiveRecord::Base

  has_many :sponsors, :dependent => :destroy
  
  attr_accessible :banner, :height, :left, :top, :category, :width, :sponsors_attributes

  accepts_nested_attributes_for :sponsors, :allow_destroy => true
  
  validates :banner, :presence => true, :uniqueness => true
  validates :sponsors, :presence => true
  validates :top, :left, :height, :width, :presence => true, :numericality => { :only_integer => true }, :if => :personalized_size?
  validate :has_beween_1_and_x_pictures
    
  BANNER_CATEGORIES = {
    "(B1) Superior - 720x100"       => "B1",
    "(B2) Lat. direito - 270x350"   => "B2",
    "(B3) Lat. direito - 270x150"   => "B3",
    "(B4) Lat. direito - 270x350"   => "B4",
    "(B5) Inferior - 200x80"        => "B5",
    "(B6) Inferior - 200x80"        => "B6",
    "(B7) Inferior - 200x80"        => "B7",
    "(B8) Inferior - 200x80"        => "B8",
    "(P1) Personalizado - ???x???"  => "P1"}
  
    def has_beween_1_and_x_pictures
      undestroyed_sponsors_count = 0

      self.sponsors.each { |s| undestroyed_sponsors_count += 1 unless s.marked_for_destruction? }

      errors.add(:sponsor, "size - #{undestroyed_sponsors_count}") if undestroyed_sponsors_count < 1
      errors.add(:sponsor, "size + #{undestroyed_sponsors_count}") if undestroyed_sponsors_count > 3
    end
  
    def personalized_size?
      self.category == "P1"
    end
    
    def is_swf?(content_type)
      content_type == "application/x-shockwave-flash"
    end

end
