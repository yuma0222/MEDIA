class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

    	t.references :user
    	t.string :title
    	t.integer :time
    	t.text :word
    	t.text :body

      t.timestamps
    end
  end
end