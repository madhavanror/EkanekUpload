class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.string :title, null: false
      t.index :title, unique: true
      t.text :description, null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
