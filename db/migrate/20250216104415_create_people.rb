class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.string :gender, null: false
      t.references :mother, foreign_key: { to_table: :people }
      t.references :father, foreign_key: { to_table: :people }
      t.references :spouse, foreign_key: { to_table: :people }

      t.timestamps
    end

    add_index :people, :name, unique: true
  end
end
