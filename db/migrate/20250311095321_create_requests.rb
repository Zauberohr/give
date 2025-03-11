class CreateRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :requests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :user_skill, null: false, foreign_key: true
      t.boolean :completed

      t.timestamps
    end
  end
end
