class CreateSentences < ActiveRecord::Migration[5.2]
  def change
    create_table :sentences do |t|
      t.text :content, null: false
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
