class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :original_url
      t.string :short_url
      t.integer :visit_count, :default => 0

      t.timestamps
    end
  end
end
