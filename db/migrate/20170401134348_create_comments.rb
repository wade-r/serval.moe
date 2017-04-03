class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :visitor_id, null: false, default: '0'
      t.text :content, null: false

      t.timestamps
    end
  end
end
