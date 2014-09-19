class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :sender, class_name: 'Dog', foreign_key: :dog_id
      t.references :recipient, class_name: 'Dog', foreign_key: :dog_id
      t.text :content

      t.timestamps
    end
  end
end
