class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :password_digest
      t.boolean :github_user, default: false
      t.string :github_uid, default: "N/A"

      t.timestamps
    end
  end
end
