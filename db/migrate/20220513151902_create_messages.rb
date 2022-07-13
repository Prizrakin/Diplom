class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :text
      t.belongs_to :chat, null: false, foreign_key: true
      t.integer :writer
      t.integer :recipient

      t.timestamps
    end
  end
end
