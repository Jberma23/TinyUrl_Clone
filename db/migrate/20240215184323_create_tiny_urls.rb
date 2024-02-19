class CreateTinyUrls < ActiveRecord::Migration[7.1]
  def change
    create_table :tiny_urls do |t|
      t.string :new_url
      t.text :original_url

      t.timestamps
    end
    add_index :tiny_urls, :new_url, unique: true
  end
end
