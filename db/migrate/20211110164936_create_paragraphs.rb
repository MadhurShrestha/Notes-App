class CreateParagraphs < ActiveRecord::Migration[6.1]
  def change
    create_table :paragraphs do |t|
      t.references :page, null: false, foreign_key: true

      t.timestamps
    end
  end
end
