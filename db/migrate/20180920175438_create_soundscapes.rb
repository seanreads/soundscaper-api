class CreateSoundscapes < ActiveRecord::Migration[5.2]
  def change
    create_table :soundscapes do |t|

      t.timestamps
    end
  end
end
