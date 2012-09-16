class Sponsor < ActiveRecord::Base
  belongs_to :banner

  attr_accessible  :url, :image
  attr_accessor :watermark
  
  has_attached_file :image,
                      :styles => lambda { |sponsor| {
                                    :thumb => {
                                        :processors     =>  sponsor.instance.watermark,
                                        :geometry       => "#{sponsor.instance.banner && sponsor.instance.banner.width}x#{sponsor.instance.banner && sponsor.instance.banner.height}#",
                                        :watermark_path => "#{Rails.root}/public/rails.png"
                                              }
                                                    }
                                        }
                                        
  after_save  :reprocess

private

  def reprocess
   	self.image.reprocess! if self.banner
  end

end