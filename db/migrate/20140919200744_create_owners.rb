class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :owner_email
      t.string :password_digest
      t.string :owner_gender
      t.date :owner_birthday

      t.timestamps
    end
  end
end
