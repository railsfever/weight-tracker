class CreateWeights < ActiveRecord::Migration
  def change
    create_table :weights do |t|
      t.integer :user_id, null: false
      t.integer :value, null: false

      t.timestamps
    end
  end
end
