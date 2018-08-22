class CreateSentRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :sent_requests do |t|
      t.references :user, index: true, foreign_key: true
      t.references :requested_user, index: true

      t.timestamps null: false
    end

    add_foreign_key :sent_requests, :users, column: :requested_user_id
    add_index :sent_requests, [:user_id, :requested_user_id], unique: true
  end
end
