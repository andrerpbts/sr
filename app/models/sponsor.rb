class Sponsor < ActiveRecord::Base
  belongs_to :banner

  attr_accessible  :url, :image


  has_attached_file :image, 
                    :styles => lambda { |sponsor| 
                      {
                         :thumb => "#{sponsor.instance.banner && sponsor.instance.banner.width}x#{sponsor.instance.banner && sponsor.instance.banner.height}#"
                      }
                    }

  after_save  :reprocess

  private

  def reprocess
   	self.image.reprocess! if self.banner
   end
end