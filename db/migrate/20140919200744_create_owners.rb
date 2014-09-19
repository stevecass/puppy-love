class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :email
      t.string :password_digest
      t.string :gender
      t.date :birthday

      t.timestamps
    end
  end
end
