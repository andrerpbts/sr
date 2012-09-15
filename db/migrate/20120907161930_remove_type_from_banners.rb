class RemoveTypeFromBanners < ActiveRecord::Migration
  def up
    remove_column :banners, :type
  end

  def down
    add_column :banners, :type, :integer
  end
end
