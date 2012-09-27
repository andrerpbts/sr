class Sponsor < ActiveRecord::Base
  belongs_to :banner

  attr_accessible  :url, :image
  
  validates_attachment :image,
   :presence => true,
   :content_type => { :content_type => %w(image/png image/jpeg image/gif application/x-shockwave-flash)},
   :size => { :in => 0..2.megabytes }
   
  has_attached_file :image,
  :url => "/banner/images/:id.:extension",
  :path => ":rails_root/public/banner/images/:id.:extension",
  :styles => lambda { |sponsor| {
    :original => {
      :geometry => "#{sponsor.instance.banner && sponsor.instance.banner.width}x#{sponsor.instance.banner && sponsor.instance.banner.height}!"}}}
   
  before_post_process :is_image?
  after_save  :reprocess

  def which_size(category)
      case category
        when "B1"
          {:w => 720, :h => 100}
        when "B2"
          {:w => 270, :h => 350}
        when "B3"
          {:w => 270, :h => 150}
        when "B4"
          {:w => 270, :h => 350}
        when "B5"
          {:w => 200, :h => 80}
        when "B6"
          {:w => 200, :h => 80}
        when "B7"
          {:w => 200, :h => 80}
        when "B8"
          {:w => 200, :h => 80}
        when "P1"
          {:w => self.banner.width, :h => self.banner.height}
        else
          {:w => 0, :h => 0}
      end
    end
  
private

  def is_image?
    !(self.image.content_type =~ /^image/).nil?
  end
   
  def reprocess
    sizes = which_size(self.banner.category)
    self.banner.height = sizes[:h]
    self.banner.width  = sizes[:w]
    
   	self.image.reprocess! if self.banner
  end

end