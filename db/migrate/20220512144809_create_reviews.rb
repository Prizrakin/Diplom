class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :salesman
      t.integer :buyer
      t.string :text
      t.integer :grade
      t.belongs_to :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
