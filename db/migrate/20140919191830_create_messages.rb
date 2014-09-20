class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.belongs_to :sender
      t.belongs_to :recipient
      t.text :content

      t.timestamps
    end
  end
end
