class Diy < ActiveRecord::Migration[5.0]
  def change
    create_table :diys do |t|
      t.text  :title
      t.text  :url
      t.string  :price
      t.text  :comment

      t.timestamps
    end
  end
end
