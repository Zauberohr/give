class AddSummaryToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :summary, :text
  end
end
