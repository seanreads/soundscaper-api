class CreateSoundscapes < ActiveRecord::Migration[5.2]
  def change
    create_table :soundscapes do |t|
      t.string :name, null: false
      t.string :woeid, null: false
      t.string :country, null: false
      t.timestamps
    end
  end
end
