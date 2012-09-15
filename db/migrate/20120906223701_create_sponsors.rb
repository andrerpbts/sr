class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :url
      t.references :banner

      t.timestamps
    end
    add_index :sponsors, :banner_id
  end
end
