class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :name
      t.belongs_to :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
