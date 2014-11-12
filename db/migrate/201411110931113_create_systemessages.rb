class CreateSystemessages < ActiveRecord::Migration
  def change
    create_table :systemessages do |t|
      t.string :title
      t.text :body
      t.boolean :trashed, default: false

      t.timestamps
    end
  end
end
