class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :email, :password_hash
      t.references :resources
      t.timestamps
    end
  end
end
