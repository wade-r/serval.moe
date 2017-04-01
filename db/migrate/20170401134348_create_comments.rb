class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :nickname, null: false, default: 'NO NAME'
      t.text :content, null: false

      t.timestamps
    end
  end
end
