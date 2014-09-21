class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.references :owner
      t.string :name
      t.string :gender
      t.date :birthday
      t.string :size
      t.string :breed
      t.string :location
      t.string :tagline
      t.text :bio
      t.string :photo_url

      t.timestamps
    end
  end
end
`