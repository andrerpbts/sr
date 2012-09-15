class Sponsor < ActiveRecord::Base
  belongs_to :banner
  
  attr_accessible :url, :image, :width, :height
  attr_accessor :width, :height
    
  has_attached_file :image, :styles => lambda { |sponsor| { 
                                         :thumb => "#{sponsor.instance.width}x#{sponsor.instance.height}#" }} 
end