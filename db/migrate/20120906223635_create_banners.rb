class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :banner
      t.integer :type
      t.integer :top
      t.integer :left
      t.integer :width
      t.string :height

      t.timestamps
    end
  end
end
