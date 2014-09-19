class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :sender, foreign_key: :dog
      t.references :recipient, foreign_key: :dog
      t.text :content

      t.timestamps
    end
  end
end
