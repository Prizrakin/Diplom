class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :card
      t.string :cvv
      t.string :date
      t.string :owner
      t.belongs_to :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
