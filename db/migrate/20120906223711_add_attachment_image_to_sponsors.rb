class AddAttachmentImageToSponsors < ActiveRecord::Migration
  def self.up
    change_table :sponsors do |t|
      t.has_attached_file :image
    end
  end

  def self.down
    drop_attached_file :sponsors, :image
  end
end
