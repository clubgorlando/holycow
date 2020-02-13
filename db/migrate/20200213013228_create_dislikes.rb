class CreateDislikes < ActiveRecord::Migration[5.2]
  def change
    create_table :dislikes do |t|
      t.references :fact, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
