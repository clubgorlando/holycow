class CreateFacts < ActiveRecord::Migration[5.2]
  def change
    create_table :facts do |t|
      t.text :message
      t.integer :holycows, default: 0
      t.integer :cowpies, default: 0
      t.timestamps
    end
  end
end
