class CreateUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :urls do |t|
      t.string :original
      t.string :slug
      t.integer :visitors_count, default: 0
      t.string :visitors_ips, array: true, default: []

      t.timestamps
    end
  end
end
