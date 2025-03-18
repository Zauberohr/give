class AddCategoryToSkills < ActiveRecord::Migration[7.1]
  def change
    add_column :skills, :category, :string
  end
end
