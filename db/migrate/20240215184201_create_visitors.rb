class CreateVisitors < ActiveRecord::Migration[7.1]
  def change
    create_table :visitors do |t|
      t.string :ip
      t.references :tiny_url, null: false, foreign_key: true

      t.timestamps
    end
  end
end
