class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.belongs_to :service, null: false, foreign_key: true
      t.integer :price
      t.string :long_description
      t.string :short_description
      t.boolean :active
      t.integer :salesman
      t.integer :buyer

      t.timestamps
    end
  end
end
