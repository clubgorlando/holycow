class AlterFactsAddUserId < ActiveRecord::Migration[5.2]
  def change
    add_column :facts, :user_id, :integer
    add_index :facts, :user_id
  end
end
