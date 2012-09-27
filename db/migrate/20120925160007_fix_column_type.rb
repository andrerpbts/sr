class FixColumnType < ActiveRecord::Migration
    def up
      add_column :banners, :category, :string
    end

    def down
      remove_column :banners, :category
    end
end
