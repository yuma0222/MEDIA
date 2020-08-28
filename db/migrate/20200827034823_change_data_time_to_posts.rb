class ChangeDataTimeToPosts < ActiveRecord::Migration[5.2]
  def change
  	change_column :posts, :time, :string
  end
end