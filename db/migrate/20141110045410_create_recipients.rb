class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.text :email

      t.timestamps
    end
  end
end
