class Sponsor < ActiveRecord::Base
  belongs_to :banner

  attr_accessible  :width, :height, :url, :image

  attr_accessor :width, :height
  
  has_attached_file :image, 
                    :styles => lambda { |sponsor| 
                      {
                         :thumb => "#{sponsor.instance.width}x#{sponsor.instance.height}#"
                      }
                    }

  after_save  :reprocess

  private

  def reprocess
    self.image.reprocess!
  end
end