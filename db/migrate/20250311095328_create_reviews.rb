class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :request, null: false, foreign_key: true
      t.integer :rating
      t.text :content
      t.text :title

      t.timestamps
    end
  end
end
