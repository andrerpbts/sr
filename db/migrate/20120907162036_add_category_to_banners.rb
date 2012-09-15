class AddCategoryToBanners < ActiveRecord::Migration
  def change
    add_column :banners, :category, :integer
  end
end
