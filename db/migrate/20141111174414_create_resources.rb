class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title, :url
      t.integer :rating
      t.integer :user_id


      t.timestamps
    end
  end
end
