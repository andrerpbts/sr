class CreateSetups < ActiveRecord::Migration
  def change
    create_table :setups do |t|
      t.integer :max_banner_image
      t.integer :max_vehicle_image

      t.timestamps
    end
  end
end
